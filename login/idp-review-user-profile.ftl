<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('global'); section>
    <#if section = "title">
        ${msg("loginProfileTitle")}
    <#elseif section = "header">
        ${msg("loginProfileTitle")}
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading">
          <h1>${msg("loginProfileTitle")}</h1>
          <p>${msg("updateProfileMessage")}</p>
        </div>

        <#if message?has_content && !messagesPerField.existsError('global')>
          <div class="wz-alert wz-alert-<#if message.type='error'>error<#elseif message.type='warning'>warning<#elseif message.type='success'>success<#else>info</#if>" role="alert">
            <svg width="16" height="16" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5ZM9.5 4a1.5 1.5 0 1 1 0 3 1.5 1.5 0 0 1 0-3ZM12 15H8a1 1 0 0 1 0-2h1v-3H8a1 1 0 0 1 0-2h2a1 1 0 0 1 1 1v4h1a1 1 0 0 1 0 2Z"/></svg>
            <span>${kcSanitize(message.summary)?no_esc}</span>
          </div>
        </#if>

        <#if messagesPerField.existsError('global')>
          <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('global'))?no_esc}</span>
        </#if>

        <form class="wz-form" id="kc-idp-review-profile-form" action="${url.loginAction}" method="post">
            <#list profile.attributes as attribute>
              <#if !(attribute.readOnly!false)>
                <#assign attrHasError = messagesPerField.existsError(attribute.name)>
                <#assign attrErrorClass = "wz-ctl" + attrHasError?then(" wz-ctl-error", "")>

                <div class="wz-field">
                  <label for="${attribute.name}">
                    <span>
                      <#if attribute.name == "email">${msg("email")}
                      <#elseif attribute.name == "firstName">${msg("firstName")}
                      <#elseif attribute.name == "lastName">${msg("lastName")}
                      <#elseif attribute.name == "username">${msg("username")}
                      <#elseif attribute.name == "company">${msg("companyLabel")}
                      <#elseif attribute.name == "jobTitle">${msg("jobTitleLabel")}
                      <#elseif attribute.name == "companySize">${msg("companySizeLabel")}
                      <#else>${advancedMsg((attribute.displayName!attribute.name))}
                      </#if>
                      <#if (attribute.required!false)><span class="wz-req">*</span></#if>
                    </span>
                  </label>

                  <#if attribute.name == "companySize">
                    <div class="wz-inputwrap">
                      <select id="${attribute.name}" name="${attribute.name}" class="${attrErrorClass}" <#if (attribute.required!false)>required</#if>>
                        <option value="1-10" <#if (attribute.value!'') == "1-10">selected</#if>>${msg("companySizeOption1")}</option>
                        <option value="11-25" <#if (attribute.value!'11-25') == "11-25">selected</#if>>${msg("companySizeOption2")}</option>
                        <option value="26-50" <#if (attribute.value!'') == "26-50">selected</#if>>${msg("companySizeOption3")}</option>
                        <option value="50+" <#if (attribute.value!'') == "50+">selected</#if>>${msg("companySizeOption4")}</option>
                      </select>
                      <svg class="wz-selchev" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m6 9 6 6 6-6"/></svg>
                    </div>
                  <#elseif attribute.name == "email">
                    <div class="wz-inputwrap">
                      <svg class="wz-lead" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="4" width="20" height="16" rx="3"/><path d="m3 6 9 7 9-7"/></svg>
                      <input type="email" id="${attribute.name}" name="${attribute.name}" value="${(attribute.value!'')}" class="${attrErrorClass} wz-haslead" <#if (attribute.required!false)>required</#if> />
                    </div>
                  <#else>
                    <input type="text" id="${attribute.name}" name="${attribute.name}"
                      value="${(attribute.value!'')}"
                      <#if attribute.name == "company">placeholder="${msg("companyPlaceholder")}"</#if>
                      <#if attribute.name == "jobTitle">placeholder="${msg("jobTitlePlaceholder")}"</#if>
                      class="${attrErrorClass}" <#if (attribute.required!false)>required</#if> />
                  </#if>

                  <#if attrHasError>
                    <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get(attribute.name))?no_esc}</span>
                  </#if>
                </div>
              </#if>
            </#list>

            <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doSubmit")}</button>
        </form>
      </div>
    </#if>
</@layout.registrationLayout>
