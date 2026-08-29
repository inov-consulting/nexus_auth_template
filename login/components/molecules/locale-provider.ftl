
<#macro kw currentLocale="" locales=[]>

  <div class="wz-dd">

      <button data-dropdown-toggle="dropdownHover" data-dropdown-trigger="hover" class="wz-ddbtn" id="menu-button" aria-expanded="true" aria-haspopup="true" type="button">
        <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="10"/><path d="M2 12h20M12 2a15 15 0 0 1 0 20M12 2a15 15 0 0 0 0 20"/></svg>
        <span class="wz-lg">${currentLocale}</span>
        <svg width="14" height="14" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true" style="opacity:.6">
          <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z" clip-rule="evenodd" />
        </svg>
      </button>

    <div id="dropdownHover" class="wz-ddmenu hidden" role="menu" aria-orientation="vertical" aria-labelledby="menu-button" tabindex="-1">
        <#list locales as locale>
            <a href="${locale.url}" role="menuitem" tabindex="-1" id="menu-item${locale.label}">
              ${locale.label}
              <#if currentLocale == locale.label><span class="wz-ck"><svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M20 6 9 17l-5-5"/></svg></span></#if>
            </a>
        </#list>
    </div>
  </div>
</#macro>
