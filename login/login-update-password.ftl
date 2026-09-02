<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <#if section = "header">
    ${msg("updatePasswordTitle")}
  <#elseif section = "form">
    <div class="wz-stack">
      <div class="wz-heading">
        <h1>${msg("passwordResetTitle")}</h1>
        <p>${msg("passwordResetDesc")}</p>
      </div>

      <#if message?has_content>
        <div class="wz-alert wz-alert-<#if message.type='error'>error<#elseif message.type='warning'>warning<#elseif message.type='success'>success<#else>info</#if>" role="alert">
          <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
          <span>${kcSanitize(message.summary)?no_esc}</span>
        </div>
      </#if>

      <form class="wz-form" id="kc-passwd-update-form" action="${url.loginAction}" method="post">
        <div class="wz-field">
          <label for="password-new"><span>${msg("passwordNew")}<span class="wz-req">*</span></span></label>
          <div class="wz-inputwrap pwd-wrapper">
            <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="11" width="16" height="10" rx="2.5"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
            <input type="password" id="password-new" name="password-new" autofocus autocomplete="new-password" placeholder="" class="wz-ctl wz-haslead<#if messagesPerField.existsError('password')> wz-ctl-error</#if>" required />
          </div>
        </div>

        <div class="wz-field">
          <label for="password-confirm"><span>${msg("passwordConfirm")}<span class="wz-req">*</span></span></label>
          <div class="wz-inputwrap pwd-wrapper">
            <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="11" width="16" height="10" rx="2.5"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
            <input type="password" id="password-confirm" name="password-confirm" autocomplete="new-password" placeholder="" class="wz-ctl wz-haslead<#if messagesPerField.existsError('password-confirm')> wz-ctl-error</#if>" required />
          </div>
        </div>

        <div class="wz-rules">
          <span><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6 9 17l-5-5"/></svg> ${msg("passwordRuleMinLength")}</span>
          <span><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6 9 17l-5-5"/></svg> ${msg("passwordRuleCase")}</span>
          <span><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6 9 17l-5-5"/></svg> ${msg("passwordRuleDigit")}</span>
          <span><svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 6 9 17l-5-5"/></svg> ${msg("passwordRuleSpecial")}</span>
        </div>

        <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doSubmit")}</button>
      </form>
    </div>
  </#if>
</@layout.registrationLayout>
