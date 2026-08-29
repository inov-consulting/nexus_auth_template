<#import "components/molecules/locale-provider.ftl" as localeProvider>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html>

    <#-- Attempt to reverse-engineer code for page’s current language, as Keycloak does not currently make this available -->
    <#assign LANG_CODE = "fr">
    <#if .locale??>
        <#assign LANG_CODE = .locale>
    </#if>
    <#if locale??>
        <#list locale.supported>
            <#items as supportedLocale>
                <#if supportedLocale.label == locale.current>
                    <#if supportedLocale.url?contains("?kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("?kc_locale=")[0..1]>
                    </#if>
                    <#if supportedLocale.url?contains("&kc_locale=")>
                        <#assign LANG_CODE = supportedLocale.url?keep_after("&kc_locale=")[0..1]>
                    </#if>
                </#if>
            </#items>
        </#list>
    </#if>

    <!--[if lt IE 9]>
    <html class="lte-ie8 ${properties.kcHtmlClass!}" lang="${LANG_CODE}"><![endif]-->
    <!--[if gt IE 8]><!-->
    <html class="${properties.kcHtmlClass!}" lang="${LANG_CODE}"><!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="robots" content="noindex, nofollow">

        <#if properties.meta?has_content>
            <#list properties.meta?split(' ') as meta>
                <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}" />
            </#list>
        </#if>
        <title><#nested "title"> - ${realm.displayName!'Plexis'}</title>

        <link rel="shortcut icon" href="${url.resourcesPath}/images/favicon.png" type="image/png" />

        <link rel="apple-touch-icon-precomposed" sizes="152x152"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-ipad-retina-152x152.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="60x60"
              href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-60x60.png?.0.1.0">
        <link rel="apple-touch-icon-precomposed" sizes="120x120"
            href="${url.resourcesPath}/images/logotype/apple-touch-icon-iphone-retina-120x120.png?.0.1.0">

        <meta name="viewport" content="width=device-width, initial-scale=1">

        <#-- End Holisticon Template <head> content -->

        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
                <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
            </#list>
        </#if>
        <#if properties.scripts?has_content>
            <#list properties.scripts?split(' ') as script>
                <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
            </#list>
        </#if>
        <#if scripts??>
            <#list scripts as script>
                <script src="${script}" type="text/javascript"></script>
            </#list>
        </#if>

    </head>
    <body class="m-0 p-0">
      <div class="wz-wrap">
          <div class="wz-pane">
              <!-- Barre du haut : retour / langue -->
              <div class="wz-toolbar">
                  <#nested "back">
                  <span></span>
                  <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                      <@localeProvider.kw currentLocale=locale.current locales=locale.supported />
                  </#if>
              </div>

              <!-- Logo -->
              <div class="wz-logo">
                  <span class="wz-logo-mark">
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 10v4M8.5 7.5A6 6 0 0 1 18 12M6.2 10.2a9 9 0 0 1 .3-2M7 17.5A9 9 0 0 1 5 12M12 3a9 9 0 0 1 9 9c0 1-.1 2-.4 3M15.5 16.5a6 6 0 0 1-3.5 1M9 21a12 12 0 0 0 3 .5"/></svg>
                  </span>
                  <span class="wz-logo-name">${realm.displayName!'Plexis'}</span>
              </div>

              <div class="wz-col">
                  <div class="wz-screen">
                      <#nested "form">
                  </div>
                  <#assign currentYear = .now?string("yyyy")>
                  <p class="wz-footer">${msg("footerCopyright", currentYear)}</p>
              </div>
          </div>

          <!-- Panneau droit : illustration -->
          <aside class="wz-aside">
              <span class="wz-blob a"></span><span class="wz-blob b"></span>
              <span class="wz-badge"><i></i><span>${msg("authBadge")}</span></span>

              <div class="wz-carousel">
                <div class="wz-carousel-inner">

                  <div class="wz-slide wz-active">
                    <div class="wz-mock">
                      <div class="wz-mh"><span class="wz-p">P</span>${msg("authSlide1Header")}<span class="wz-cnt">3</span></div>
                      <div class="wz-mb">
                        <div class="wz-mrow">
                          <span class="wz-ic"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="5" width="20" height="14" rx="2"/><path d="M2 10h20"/></svg></span>
                          <span class="wz-tx"><b>${msg("authSlide1Row1Title")}</b><small>${msg("authSlide1Row1Meta")}</small></span>
                          <span class="wz-tag">${msg("authSlide1Row1Tag")}</span>
                        </div>
                        <div class="wz-mrow">
                          <span class="wz-ic"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M7 3h7l4 4v14H7z"/><path d="M14 3v4h4M10 12h5M10 16h5"/></svg></span>
                          <span class="wz-tx"><b>${msg("authSlide1Row2Title")}</b><small>${msg("authSlide1Row2Meta")}</small></span>
                          <span class="wz-tag">${msg("authSlide1Row2Tag")}</span>
                        </div>
                        <div class="wz-mrow">
                          <span class="wz-ic"><svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H8l-4 4V5a2 2 0 0 1 2-2h13a2 2 0 0 1 2 2z"/></svg></span>
                          <span class="wz-tx"><b>${msg("authSlide1Row3Title")}</b><small>${msg("authSlide1Row3Meta")}</small></span>
                          <span class="wz-tag">${msg("authSlide1Row3Tag")}</span>
                        </div>
                      </div>
                    </div>
                    <h2>${msg("authSlide1Title")}</h2>
                    <p>${msg("authSlide1Body")}</p>
                  </div>

                  <div class="wz-slide">
                    <div class="wz-tools">
                      <div class="wz-chips">
                        <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15a2 2 0 0 1-2 2H8l-4 4V5a2 2 0 0 1 2-2h13a2 2 0 0 1 2 2z"/></svg></span>
                        <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 8 12 3l9 5v8l-9 5-9-5z"/><path d="M3 8l9 5 9-5M12 13v10"/></svg></span>
                        <span class="wz-up"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="2" y="5" width="20" height="14" rx="2"/><path d="M2 10h20"/></svg></span>
                        <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17.5 19a4.5 4.5 0 0 0 0-9 6 6 0 0 0-11.6 1.5A3.5 3.5 0 0 0 6.5 19z"/></svg></span>
                        <span><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><ellipse cx="12" cy="5" rx="8" ry="3"/><path d="M4 5v14c0 1.7 3.6 3 8 3s8-1.3 8-3V5M4 12c0 1.7 3.6 3 8 3s8-1.3 8-3"/></svg></span>
                      </div>
                      <div class="wz-dash"><div class="wz-bar"></div><div class="wz-cells"><i></i><i></i><i></i></div></div>
                    </div>
                    <h2>${msg("authSlide2Title")}</h2>
                    <p>${msg("authSlide2Body")}</p>
                  </div>

                  <div class="wz-slide">
                    <div class="wz-mock">
                      <div class="wz-mh"><span class="wz-p">P</span>${msg("authSlide3Header")}</div>
                      <div class="wz-mb">
                        <div class="wz-arow"><span class="wz-t">${msg("authSlide3Row1Time")}</span><span class="wz-w">${msg("authSlide3Row1Who")}</span><span class="wz-d">${msg("authSlide3Row1Desc")}</span></div>
                        <div class="wz-arow"><span class="wz-t">${msg("authSlide3Row2Time")}</span><span class="wz-w">${msg("authSlide3Row2Who")}</span><span class="wz-d">${msg("authSlide3Row2Desc")}</span></div>
                        <div class="wz-arow"><span class="wz-t">${msg("authSlide3Row3Time")}</span><span class="wz-w">${msg("authSlide3Row3Who")}</span><span class="wz-d">${msg("authSlide3Row3Desc")}</span></div>
                      </div>
                    </div>
                    <h2>${msg("authSlide3Title")}</h2>
                    <p>${msg("authSlide3Body")}</p>
                  </div>

                  <div class="wz-slide">
                    <div class="wz-mock">
                      <div class="wz-mh"><span class="wz-p">P</span>${msg("authSlide4Header")}</div>
                      <div class="wz-mb">
                        <div class="wz-proofbox">
                          <div class="wz-pl">${msg("authSlide4Reconcile")}</div>
                          <div class="wz-pr"><span>${msg("authSlide4Order")}</span><span class="wz-mono" style="color:#475569">${msg("authSlide4OrderValue")}</span></div>
                          <div class="wz-pr"><span>${msg("authSlide4Delivery")}</span><span class="wz-mono" style="color:#475569">${msg("authSlide4DeliveryValue")}</span></div>
                        </div>
                        <div class="wz-proofbtns"><span class="wz-ok">${msg("authSlide4Validate")}</span><span class="wz-no">${msg("authSlide4Reject")}</span></div>
                      </div>
                    </div>
                    <h2>${msg("authSlide4Title")}</h2>
                    <p>${msg("authSlide4Body")}</p>
                  </div>

                </div>
              </div>

              <div class="wz-controls">
                  <div class="wz-dots">
                      <button type="button" aria-current="true" aria-label="1"></button>
                      <button type="button" aria-current="false" aria-label="2"></button>
                      <button type="button" aria-current="false" aria-label="3"></button>
                      <button type="button" aria-current="false" aria-label="4"></button>
                  </div>
                  <div class="wz-arrows">
                      <button type="button" data-dir="prev" aria-label="précédent"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m14 6-6 6 6 6"/></svg></button>
                      <button type="button" data-dir="next" aria-label="suivant"><svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m10 6 6 6-6 6"/></svg></button>
                  </div>
              </div>
              <span class="wz-kc">
                  <svg width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"/><path d="m9 12 2 2 4-4"/></svg>
                  <span>${msg("authSecureNote")}</span>
              </span>
          </aside>
      </div>
    </body>
</html>
</#macro>
