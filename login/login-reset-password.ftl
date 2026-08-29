<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("emailForgotTitle")}
    <#elseif section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "back">
        <a class="wz-backbtn" href="${url.loginUrl}" aria-label="${msg("backToLogin")}">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="m14 6-6 6 6 6" /></svg>
        </a>
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading">
          <h1>${msg("forgotPasswordTitle")}</h1>
          <p>${msg("forgotPasswordInstruction")}</p>
        </div>

        <form class="wz-form" id="kc-reset-password-form" action="${url.loginAction}" method="post">
            <div class="wz-field">
              <label for="username"><span>${msg("emailLabel")}<span class="wz-req">*</span></span></label>
              <div class="wz-inputwrap">
                <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                <input type="email" id="username" name="username" placeholder="${msg("emailPlaceholder")}" class="wz-ctl wz-haslead<#if messagesPerField.existsError('email')> wz-ctl-error</#if>" autofocus autocomplete="off" required />
              </div>
              <#if messagesPerField.existsError('email')>
                <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
              </#if>
            </div>

            <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("sendButton")}</button>

            <div class="wz-note">
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 16v-4M12 8h.01"/></svg>
              <span>${msg("resetPasswordCodeNote")}</span>
            </div>

            <p class="wz-alt">
              <a class="wz-link" href="${url.loginUrl}">${msg("backToLogin")}</a>
            </p>
        </form>
      </div>
    </#if>
</@layout.registrationLayout>
