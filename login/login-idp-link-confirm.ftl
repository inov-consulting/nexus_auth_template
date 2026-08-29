<#import "template.ftl" as layout>
<#import "components/atoms/form.ftl" as form>

<@layout.registrationLayout; section>
  <#if section="header">
    ${msg("confirmLinkIdpTitle")}
  <#elseif section="form">
    <div class="wz-stack">
      <div class="wz-heading"><h1>${msg("ipsLinkTitle")}</h1></div>

      <@form.kw action=url.loginAction method="post">
        <button type="submit" name="submitAction" id="linkAccount" value="linkAccount" class="wz-btn wz-ghost">
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" width="16" height="16"><path stroke-linecap="round" stroke-linejoin="round" d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244" /></svg>
          ${msg("confirmLinkIdpContinue", idpDisplayName)}
        </button>

        <div class="wz-divider"><span>${msg("or")}</span></div>

        <button type="submit" name="submitAction" id="updateProfile" value="updateProfile" class="wz-btn" style="background-color:#4f46d6;color:#fff;">
          ${msg("confirmLinkIdpReviewProfile")}
        </button>
      </@form.kw>
    </div>
  </#if>
</@layout.registrationLayout>
