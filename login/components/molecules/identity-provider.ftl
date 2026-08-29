<#import "/assets/providers/providers.ftl" as providerIcons>

<#macro kw providers=[]>
  <p class="wz-hint" style="text-align:center;">
    ${msg("identity-provider-login-label")}
  </p>

  <div class="wz-grid2" style="grid-template-columns:repeat(${providers?size}, 1fr);">
    <#list providers as provider>
      <a
        href="${provider.loginUrl}"
        data-provider="${provider.alias}"
        type="button"
        style="display:flex;align-items:center;justify-content:center;height:44px;border:1.5px solid var(--wz-line-2);border-radius:var(--wz-radius);"
      >
        <#if providerIcons[provider.alias]??>
          <div style="height:20px;width:20px;">
            <#if provider.alias == 'linkedin-openid-connect'>
                <@providerIcons[linkedin] />
            <#else>
                <@providerIcons[provider.alias] />
            </#if>
          </div>
        <#else>
          <div style="height:20px;width:20px;">
           <#if provider.alias == 'linkedin-openid-connect'>
               <@providerIcons['linkedin'] />
           <#else>
           ${provider.displayName!}
           </#if></div>
        </#if>
      </a>
    </#list>
  </div>
</#macro>
