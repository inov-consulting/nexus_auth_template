<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "back">
      <a class="wz-backbtn" href="${url.loginUrl}" aria-label="${msg("backToLogin")}">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="m14 6-6 6 6 6" /></svg>
      </a>
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading"><h1>${msg("emailVerificationTitle")}</h1></div>

        <div class="wz-note wz-note-brand" role="alert">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" /></svg>
          <div>
            <p>${msg("emailVerifyInstruction1",user.email)?no_esc}</p>
            <p style="margin-top:6px;">${msg("emailVerifyInstruction2")} <a class="wz-link" href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}</p>
          </div>
        </div>
      </div>
    <#elseif section = "info">
      <div class="wz-stack">
        <div class="wz-heading"><h1>${msg("emailVerificationTitle")}</h1></div>

        <div class="wz-note wz-note-brand" role="alert">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" /></svg>
          <div>
            <p>${msg("emailVerifyInstruction2")} <a class="wz-link" href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}</p>
          </div>
        </div>
      </div>
    </#if>
</@layout.registrationLayout>
