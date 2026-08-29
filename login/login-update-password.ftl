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
