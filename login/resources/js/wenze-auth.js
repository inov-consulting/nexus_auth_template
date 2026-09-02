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

  /* ---- Soft custom validation for checkboxes that can't rely on the
     native "required" bubble (e.g. a checkbox inside a label with rich,
     clickable content). Mark the input with data-required-message="...". ---- */
  function clearSoftError(input) {
    input.classList.remove("wz-ctl-error");
    var label = input.closest("label") || input;
    var next = label.nextElementSibling;
    if (next && next.classList.contains("wz-soft-required-error")) {
      next.parentNode.removeChild(next);
    }
  }
  function showSoftError(input) {
    clearSoftError(input);
    input.classList.add("wz-ctl-error");
    var span = document.createElement("span");
    span.className = "wz-error-text wz-soft-required-error";
    span.setAttribute("aria-live", "polite");
    span.textContent = input.getAttribute("data-required-message");
    var label = input.closest("label") || input;
    label.parentNode.insertBefore(span, label.nextSibling);
  }

  /* ---- Submit loading state: spinner on the button + soft page fade,
     so the click gives instant feedback instead of an abrupt blank page
     while the browser navigates to the next (server-rendered) screen. ---- */
  function wireFormLoading(form) {
    if (form.dataset.loadingWired === "true") return;
    form.dataset.loadingWired = "true";

    var lastClicked = null;
    Array.prototype.slice.call(form.querySelectorAll('button[type="submit"]')).forEach(function (b) {
      b.addEventListener("click", function () { lastClicked = b; });
    });

    var softRequired = Array.prototype.slice.call(form.querySelectorAll("[data-required-message]"));
    softRequired.forEach(function (input) {
      input.addEventListener("change", function () {
        if (input.checked) clearSoftError(input);
      });
    });

    form.addEventListener("submit", function (e) {
      var firstInvalid = null;
      softRequired.forEach(function (input) {
        if (!input.checked) {
          showSoftError(input);
          if (!firstInvalid) firstInvalid = input;
        } else {
          clearSoftError(input);
        }
      });
      if (firstInvalid) {
        e.preventDefault();
        firstInvalid.focus();
        return;
      }

      var btn = lastClicked || form.querySelector('button[type="submit"]');
      if (!btn || btn.disabled) return;

      btn.style.minWidth = btn.offsetWidth + "px";
      btn.style.minHeight = btn.offsetHeight + "px";
      btn.dataset.originalHtml = btn.innerHTML;
      btn.disabled = true;
      btn.setAttribute("aria-busy", "true");
      btn.innerHTML = '<span class="wz-spinner" aria-hidden="true"></span>';

      var wrap = document.querySelector(".wz-wrap");
      if (wrap) wrap.classList.add("wz-navigating");
    });
  }

  function scanForms() {
    document.querySelectorAll(".wz-form").forEach(wireFormLoading);
  }

  /* ---- Loading state for plain-link navigations (social/provider buttons,
     "back to login", etc.) that don't go through a <form> submit. ---- */
  function wireLinkLoading(link) {
    if (link.dataset.loadingWired === "true") return;
    link.dataset.loadingWired = "true";

    link.addEventListener("click", function (e) {
      if (e.defaultPrevented || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || e.button !== 0) return;
      if (link.classList.contains("wz-link-loading")) { e.preventDefault(); return; }
      link.classList.add("wz-link-loading");

      var wrap = document.querySelector(".wz-wrap");
      if (wrap) wrap.classList.add("wz-navigating");
    });
  }

  function scanLinks() {
    document.querySelectorAll("a[data-provider]").forEach(wireLinkLoading);
  }

  function run() {
    scanOtp();
    scanCarousels();
    scanForms();
    scanLinks();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", run);
  } else {
    run();
  }
})();
