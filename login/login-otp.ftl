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
