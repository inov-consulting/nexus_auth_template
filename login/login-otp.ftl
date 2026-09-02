<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginTitle",realm.displayName)}
    <#elseif section = "header">
        ${msg("loginTitleHtml",realm.displayNameHtml)?no_esc}
    <#elseif section = "back">
        <a class="wz-backbtn" href="${url.loginUrl}" aria-label="${msg("backToLogin")}">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="m14 6-6 6 6 6" /></svg>
        </a>
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading">
          <h1>${msg("loginTotpOneTime")}</h1>
          <p>${msg("loginTotpStep3")}</p>
        </div>

        <#if message?has_content && !messagesPerField.existsError('totp')>
          <div class="wz-alert wz-alert-<#if message.type='error'>error<#elseif message.type='warning'>warning<#elseif message.type='success'>success<#else>info</#if>" role="alert">
            <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
            <span>${kcSanitize(message.summary)?no_esc}</span>
          </div>
        </#if>

        <#if messagesPerField.existsError('totp')>
          <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('totp'))?no_esc}</span>
        </#if>

        <form class="wz-form" id="kc-totp-login-form" action="${url.loginAction}" method="post">
          <input id="totp" name="otp" data-qa="otp" autocomplete="off" type="hidden" />

          <div class="wz-field">
            <span class="wz-otp-head">${msg("loginTotpOneTime")}</span>
            <div class="wz-otp<#if messagesPerField.existsError('totp')> wz-otp-error</#if>" data-otp-target="totp">
              <input type="text" inputmode="numeric" id="first" maxlength="1" autofocus />
              <input type="text" inputmode="numeric" id="second" maxlength="1" />
              <input type="text" inputmode="numeric" id="third" maxlength="1" />
              <input type="text" inputmode="numeric" id="fourth" maxlength="1" />
              <input type="text" inputmode="numeric" id="fifth" maxlength="1" />
              <input type="text" inputmode="numeric" id="sixth" maxlength="1" />
            </div>
          </div>

          <button type="submit" name="login" id="kc-login" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doLogIn")}</button>
        </form>
      </div>
    </#if>
</@layout.registrationLayout>
