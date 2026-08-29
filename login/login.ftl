<#import "template_login.ftl" as layout>
<#import "components/molecules/identity-provider.ftl" as identityProvider>

<@layout.registrationLayout displayInfo=(social.displayInfo)!false && realm.password && realm.registrationAllowed && !registrationDisabled??; section>

    <#if section = "title">
        ${msg("loginWelcome",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading">
          <h1>${msg("loginWelcome")}</h1>
          <p>${msg("loginTitle")}</p>
        </div>

        <#if message?has_content>
            <#if message.type = 'success'>
              <div class="wz-alert wz-alert-success" role="alert">
                <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
                <span>${message.summary}</span>
              </div>
            </#if>
        </#if>

        <form class="wz-form" action="${url.loginAction}" method="post">
            <#assign hasCredError = messagesPerField.existsError('username','password')>
            <#if hasCredError>
              <span class="wz-error-text" aria-live="polite">
                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
              </span>
            </#if>

            <#if !realm.loginWithEmailAllowed>
                <#if usernameEditDisabled??>
                  <div class="wz-field">
                    <label for="username"><span>${msg("username")}</span></label>
                    <div class="wz-inputwrap">
                      <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 7a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z"/><path d="M4 21v-1a6 6 0 0 1 6-6h4a6 6 0 0 1 6 6v1"/></svg>
                      <input type="text" data-qa="username" value="${(login.username!'')}" name="username" placeholder="${msg("username")}" class="wz-ctl wz-haslead" readonly />
                    </div>
                  </div>
                <#else>
                  <div class="wz-field">
                    <label for="username"><span>${msg("username")}<span class="wz-req">*</span></span></label>
                    <div class="wz-inputwrap">
                      <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 7a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z"/><path d="M4 21v-1a6 6 0 0 1 6-6h4a6 6 0 0 1 6 6v1"/></svg>
                      <input type="text" id="username" data-qa="username" value="${(login.username!'')}" name="username" placeholder="${msg("username")}" class="wz-ctl wz-haslead<#if hasCredError> wz-ctl-error</#if>" autofocus autocomplete="off" />
                    </div>
                  </div>
                </#if>
            <#elseif !realm.registrationEmailAsUsername>
                <#if usernameEditDisabled??>
                  <div class="wz-field">
                    <label for="username"><span>${msg("usernameOrEmail")}</span></label>
                    <div class="wz-inputwrap">
                      <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                      <input type="text" data-qa="username" value="${(login.username!'')}" name="username" placeholder="${msg("usernameOrEmail")}" class="wz-ctl wz-haslead" readonly />
                    </div>
                  </div>
                <#else>
                  <div class="wz-field">
                    <label for="username"><span>${msg("usernameOrEmail")}<span class="wz-req">*</span></span></label>
                    <div class="wz-inputwrap">
                      <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                      <input type="text" data-qa="username" value="${(login.username!'')}" name="username" id="username" placeholder="${msg("usernameOrEmail")}" class="wz-ctl wz-haslead<#if hasCredError> wz-ctl-error</#if>" autofocus autocomplete="off" />
                    </div>
                  </div>
                </#if>
            <#else>
              <div class="wz-field">
                <label for="username"><span>${msg("email")}<span class="wz-req">*</span></span></label>
                <div class="wz-inputwrap">
                  <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                  <#if usernameEditDisabled??>
                    <input type="email" value="${(login.username!'')}" name="username" placeholder="${msg("email")}" class="wz-ctl wz-haslead" readonly />
                  <#else>
                    <input type="email" value="${(login.username!'')}" name="username" placeholder="${msg("email")}" class="wz-ctl wz-haslead<#if hasCredError> wz-ctl-error</#if>" autofocus autocomplete="off" />
                  </#if>
                </div>
              </div>
            </#if>

            <div class="wz-field">
              <label for="password"><span>${msg("password")}<span class="wz-req">*</span></span></label>
              <div class="wz-inputwrap pwd-wrapper">
                <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="11" width="16" height="10" rx="2.5"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
                <input id="password" data-qa="password" class="wz-ctl wz-haslead<#if hasCredError> wz-ctl-error</#if>" name="password" type="password" autocomplete="off" placeholder="" />
              </div>
            </div>

            <div class="wz-rowbetween">
                <#if realm.rememberMe && !usernameEditDisabled??>
                  <label class="wz-check">
                    <input type="checkbox" name="rememberMe" <#if login.rememberMe??>checked</#if> />
                    ${msg("rememberMe")}
                  </label>
                <#else>
                  <span></span>
                </#if>
                <#if realm.resetPasswordAllowed>
                  <a class="wz-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                </#if>
            </div>

            <#if message?has_content && (message.type == "error" || message.type == "warning")>
              <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("tryAgain")}</button>
            <#else>
              <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doLogIn")}</button>
            </#if>

            <#if realm.password && social.providers??>
              <div class="wz-divider"><span>${msg("or")}</span></div>
              <div class="wz-providers">
                <@identityProvider.kw providers=social.providers />
              </div>
            </#if>

            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
              <p class="wz-alt">${msg("noEsigmapAccount")} <a class="wz-link" href="${url.registrationUrl}">${msg("registerLink")}</a></p>
            </#if>
        </form>
      </div>
    </#if>
</@layout.registrationLayout>
