(function () {
  "use strict";

  /* ---- OTP boxes: auto-advance, backspace, paste, sync to hidden field ---- */
  function wireOtpGroup(group) {
    if (group.dataset.wired === "true") return;
    group.dataset.wired = "true";

    var targetId = group.getAttribute("data-otp-target");
    var target = targetId ? document.getElementById(targetId) : null;
    var boxes = Array.prototype.slice.call(group.querySelectorAll("input"));

    function sync() {
      if (!target) return;
      target.value = boxes.map(function (b) { return b.value; }).join("");
    }

    boxes.forEach(function (box, i) {
      box.addEventListener("input", function () {
        box.value = box.value.replace(/[^0-9a-zA-Z]/g, "").slice(0, 1);
        if (box.value && boxes[i + 1]) boxes[i + 1].focus();
        sync();
      });
      box.addEventListener("keydown", function (e) {
        if (e.key === "Backspace" && !box.value && boxes[i - 1]) {
          boxes[i - 1].focus();
        }
      });
      box.addEventListener("paste", function (e) {
        var text = (e.clipboardData || window.clipboardData).getData("text");
        if (!text) return;
        e.preventDefault();
        var chars = text.replace(/[^0-9a-zA-Z]/g, "").split("");
        boxes.forEach(function (b, k) { b.value = chars[k] || ""; });
        var next = boxes[Math.min(chars.length, boxes.length - 1)];
        if (next) next.focus();
        sync();
      });
    });
  }

  function scanOtp() {
    document.querySelectorAll(".wz-otp").forEach(wireOtpGroup);
  }

  /* ---- Aside carousel ---- */
  function initCarousel(root) {
    if (root.dataset.wired === "true") return;
    root.dataset.wired = "true";

    var slides = Array.prototype.slice.call(root.querySelectorAll(".wz-slide"));
    var dotsWrap = root.querySelector(".wz-dots");
    var dots = dotsWrap ? Array.prototype.slice.call(dotsWrap.querySelectorAll("button")) : [];
    var prevBtn = root.querySelector('[data-dir="prev"]');
    var nextBtn = root.querySelector('[data-dir="next"]');
    var index = 0;
    var timer = null;

    function show(n) {
      index = ((n % slides.length) + slides.length) % slides.length;
      slides.forEach(function (s, k) { s.classList.toggle("wz-active", k === index); });
      dots.forEach(function (d, k) { d.setAttribute("aria-current", k === index ? "true" : "false"); });
    }

    function start() {
      stop();
      if (slides.length > 1) {
        timer = window.setInterval(function () { show(index + 1); }, 6000);
      }
    }
    function stop() { if (timer) { window.clearInterval(timer); timer = null; } }

    dots.forEach(function (d, k) { d.addEventListener("click", function () { show(k); start(); }); });
    if (prevBtn) prevBtn.addEventListener("click", function () { show(index - 1); start(); });
    if (nextBtn) nextBtn.addEventListener("click", function () { show(index + 1); start(); });
    root.addEventListener("mouseenter", stop);
    root.addEventListener("mouseleave", start);

    show(0);
    start();
  }

  function scanCarousels() {
    document.querySelectorAll(".wz-aside").forEach(initCarousel);
  }

  function run() {
    scanOtp();
    scanCarousels();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", run);
  } else {
    run();
  }
})();
