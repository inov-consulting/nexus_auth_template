<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
  <#if section = "header">
    ${msg("loginProfileTitle")}
  <#elseif section = "form">
    <div class="wz-stack">
      <div class="wz-heading"><h1>${msg("loginProfileTitle")}</h1></div>

      <#if message?has_content>
        <div class="wz-alert wz-alert-<#if message.type='error'>error<#elseif message.type='warning'>warning<#elseif message.type='success'>success<#else>info</#if>" role="alert">
          <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
          <span>${kcSanitize(message.summary)?no_esc}</span>
        </div>
      </#if>

      <form class="wz-form" id="kc-update-profile-form" action="${url.loginAction}" method="post">

          <#if messagesPerField.existsError('username','password')>
            <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.getFirstError('username','email','password'))?no_esc}</span>
          </#if>

        <#if user.editUsernameAllowed>
          <div class="wz-field">
            <label for="username"><span>${msg("username")}<span class="wz-req">*</span></span></label>
            <input type="text" id="username" data-qa="username" value="${(user.username!'')}" name="username" placeholder="${msg("username")}" class="wz-ctl<#if messagesPerField.existsError('username')> wz-ctl-error</#if>" readonly />
            <#if messagesPerField.existsError('username')>
              <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
            </#if>
          </div>
        </#if>

        <div class="wz-field">
          <label for="email"><span>${msg("email")}<span class="wz-req">*</span></span></label>
          <input type="email" id="email" data-qa="email" value="${(user.email!'')}" name="email" placeholder="${msg("username")}" class="wz-ctl<#if messagesPerField.existsError('email')> wz-ctl-error</#if>" readonly />
          <#if messagesPerField.existsError('email')>
            <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
          </#if>
        </div>

        <div class="wz-field">
          <label for="firstName"><span>${msg("firstName")}<span class="wz-req">*</span></span></label>
          <input type="text" id="firstName" data-qa="firstName" value="${(user.firstName!'')}" name="firstName" placeholder="${msg("firstName")}" class="wz-ctl<#if messagesPerField.existsError('firstName')> wz-ctl-error</#if>" required />
          <#if messagesPerField.existsError('firstName')>
            <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
          </#if>
        </div>

        <div class="wz-field">
          <label for="lastName"><span>${msg("lastName")}</span></label>
          <input type="text" id="lastName" data-qa="lastName" value="${(user.lastName!'')}" name="lastName" placeholder="${msg("lastName")}" class="wz-ctl<#if messagesPerField.existsError('lastName')> wz-ctl-error</#if>" />
          <#if messagesPerField.existsError('lastName')>
            <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
          </#if>
        </div>

        <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doSubmit")}</button>
      </form>
    </div>
  </#if>
</@layout.registrationLayout>
