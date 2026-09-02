<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "title">
        ${msg("pageExpiredTitle")}
    <#elseif section = "form">
      <div class="wz-stack">
        <div class="wz-heading"><h1>${msg("pageExpiredTitle")}</h1></div>

        <div class="wz-note" role="alert">
          <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 8v5M12 16h.01"/></svg>
          <div>
            <p>${msg("pageExpiredRestartText")} <a class="wz-link" id="loginRestartLink" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a>.</p>
            <p style="margin-top:8px;">${msg("pageExpiredContinueText")} <a class="wz-link" id="loginContinueLink" href="${url.loginAction}">${msg("doClickHere")}</a>.</p>
          </div>
        </div>
      </div>
    </#if>
</@layout.registrationLayout>
