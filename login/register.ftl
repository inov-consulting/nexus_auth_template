<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("registerWithTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("registerWithTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "back">
        <a class="wz-backbtn" href="${url.loginUrl}" aria-label="${msg("backToLogin")}">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="m14 6-6 6 6 6" /></svg>
        </a>
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading">
          <h1>${msg("registerWithTitle2")}</h1>
          <p>${msg("registerWithText2")}</p>
        </div>

        <form class="wz-form" action="${url.registrationAction}" method="post">
            <#if !realm.registrationEmailAsUsername>
              <div class="wz-field">
                <label for="username"><span>${msg("createUsername")}<span class="wz-req">*</span></span></label>
                <div class="wz-inputwrap">
                  <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M16 7a4 4 0 1 1-8 0 4 4 0 0 1 8 0Z"/><path d="M4 21v-1a6 6 0 0 1 6-6h4a6 6 0 0 1 6 6v1"/></svg>
                  <input id="username" type="text" data-qa="username" value="${(register.formData.username!'')}" name="username" placeholder="${msg("username")}" class="wz-ctl wz-haslead" readonly />
                </div>
                <#if messagesPerField.existsError('username')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                </#if>
              </div>
            </#if>

            <div class="wz-grid2">
              <div class="wz-field">
                <label for="firstName"><span>${msg("firstName")}<span class="wz-req">*</span></span></label>
                <input type="text" id="firstName" data-qa="firstName" value="${(register.formData.firstName!'')}" name="firstName" placeholder="" class="wz-ctl<#if messagesPerField.existsError('firstName')> wz-ctl-error</#if>" required />
                <#if messagesPerField.existsError('firstName')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
                </#if>
              </div>
              <div class="wz-field">
                <label for="lastName"><span>${msg("lastName")}<span class="wz-req">*</span></span></label>
                <input type="text" id="lastName" data-qa="lastName" value="${(register.formData.lastName!'')}" name="lastName" placeholder="" class="wz-ctl<#if messagesPerField.existsError('lastName')> wz-ctl-error</#if>" required />
                <#if messagesPerField.existsError('lastName')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
                </#if>
              </div>
            </div>

            <div class="wz-field">
              <label for="email"><span>${msg("email")}<span class="wz-req">*</span></span></label>
              <div class="wz-inputwrap">
                <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                <input type="email" id="email" data-qa="email" value="${(register.formData.email!'')}" name="email" placeholder="example@domain.abc" class="wz-ctl wz-haslead<#if messagesPerField.existsError('email')> wz-ctl-error</#if>" required />
              </div>
              <#if messagesPerField.existsError('email')>
                <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
              </#if>
            </div>

            <div class="wz-grid2">
              <div class="wz-field">
                <label for="company"><span>${msg("companyLabel")}<span class="wz-req">*</span></span></label>
                <input type="text" id="company" data-qa="company" value="${(register.formData['user.attributes.company']!'')}" name="user.attributes.company" placeholder="${msg("companyPlaceholder")}" class="wz-ctl<#if messagesPerField.existsError('user.attributes.company')> wz-ctl-error</#if>" required />
                <#if messagesPerField.existsError('user.attributes.company')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('user.attributes.company'))?no_esc}</span>
                </#if>
              </div>
              <div class="wz-field">
                <label for="jobTitle"><span>${msg("jobTitleLabel")}<span class="wz-req">*</span></span></label>
                <input type="text" id="jobTitle" data-qa="jobTitle" value="${(register.formData['user.attributes.jobTitle']!'')}" name="user.attributes.jobTitle" placeholder="${msg("jobTitlePlaceholder")}" class="wz-ctl<#if messagesPerField.existsError('user.attributes.jobTitle')> wz-ctl-error</#if>" required />
                <#if messagesPerField.existsError('user.attributes.jobTitle')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('user.attributes.jobTitle'))?no_esc}</span>
                </#if>
              </div>
            </div>

            <div class="wz-field">
              <label for="companySize"><span>${msg("companySizeLabel")}<span class="wz-req">*</span></span></label>
              <div class="wz-inputwrap">
                <select id="companySize" name="user.attributes.companySize" class="wz-ctl" required>
                  <option value="1-10">${msg("companySizeOption1")}</option>
                  <option value="11-25" selected>${msg("companySizeOption2")}</option>
                  <option value="26-50">${msg("companySizeOption3")}</option>
                  <option value="50+">${msg("companySizeOption4")}</option>
                </select>
                <svg class="wz-selchev" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m6 9 6 6 6-6"/></svg>
              </div>
              <span class="wz-hint">${msg("companySizeHint")}</span>
            </div>

            <#if passwordRequired>
              <div class="wz-field">
                <label for="password"><span>${msg("createPassword")}<span class="wz-req">*</span></span></label>
                <div class="wz-inputwrap pwd-wrapper">
                  <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="11" width="16" height="10" rx="2.5"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
                  <input type="password" id="password" data-qa="password" name="password" class="wz-ctl wz-haslead<#if messagesPerField.existsError('password')> wz-ctl-error</#if>" required />
                </div>
                <#if messagesPerField.existsError('password')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                </#if>
              </div>

              <div class="wz-field">
                <label for="password-confirm"><span>${msg("passwordConfirm")}<span class="wz-req">*</span></span></label>
                <div class="wz-inputwrap pwd-wrapper">
                  <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="4" y="11" width="16" height="10" rx="2.5"/><path d="M8 11V8a4 4 0 0 1 8 0v3"/></svg>
                  <input type="password" id="password-confirm" data-qa="password" name="password-confirm" class="wz-ctl wz-haslead<#if messagesPerField.existsError('password-confirm')> wz-ctl-error</#if>" required />
                </div>
                <#if messagesPerField.existsError('password-confirm')>
                  <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                </#if>
              </div>
            </#if>

            <#if recaptchaRequired??>
              <div class="form-group">
                <div class="${properties.kcInputWrapperClass!}">
                  <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
              </div>
            </#if>

            <label class="wz-check" style="align-items:flex-start;gap:10px">
              <input type="checkbox" required style="margin-top:2px" />
              <span style="font-size:11.5px;line-height:1.5;color:var(--wz-ink-3)">${msg("acceptTermsLabel")?no_esc}</span>
            </label>

            <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doRegister")}</button>

            <p class="wz-alt">${msg("alreadyHaveAccount")} <a class="wz-link" href="${url.loginUrl}">${msg("doLogIn")}</a></p>
        </form>
      </div>
    </#if>
</@layout.registrationLayout>
