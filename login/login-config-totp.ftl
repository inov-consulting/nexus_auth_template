<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
  <#if section = "title">
    ${msg("loginTotpTitle")}
  <#elseif section = "header">
    ${msg("loginTotpTitle")}
  <#elseif section = "form">
    <div class="wz-stack">
      <div class="wz-heading">
        <h1>${msg("loginTotpTitle")}</h1>
      </div>

      <ol style="display:flex;flex-direction:column;gap:16px;padding-left:18px;">
        <li>
          <p class="wz-hint" style="font-size:13px;color:var(--wz-ink-2);">${msg("loginTotpStep1")}</p>

          <div class="wz-grid2" style="grid-template-columns:repeat(3,1fr);margin-top:10px;">
            <div class="wz-inputwrap" style="border:1px solid var(--wz-line-2);border-radius:var(--wz-radius);padding:8px;gap:8px;">
              <img style="width:32px;height:32px;border-radius:8px;" src="${url.resourcesPath}/images/google_auth.png"/>
              <a target="_blank" href="https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2&hl=fr&gl=US" style="font-size:12px;color:var(--wz-ink);">Google Authenticator</a>
            </div>
            <div class="wz-inputwrap" style="border:1px solid var(--wz-line-2);border-radius:var(--wz-radius);padding:8px;gap:8px;">
              <img style="width:32px;height:32px;border-radius:8px;" src="${url.resourcesPath}/images/authy.png"/>
              <a target="_blank" href="https://authy.com/download/" style="font-size:12px;color:var(--wz-ink);">Microsoft Authenticator</a>
            </div>
            <div class="wz-inputwrap" style="border:1px solid var(--wz-line-2);border-radius:var(--wz-radius);padding:8px;gap:8px;">
              <img style="width:32px;height:32px;border-radius:8px;" src="${url.resourcesPath}/images/free_otp.png"/>
              <a target="_blank" href="https://freeotp.github.io/" style="font-size:12px;color:var(--wz-ink);">Free OTP</a>
            </div>
          </div>
        </li>
        <li>
          <p class="wz-hint" style="font-size:13px;color:var(--wz-ink-2);">
            ${msg("loginTotpStep2")}
          </p>
          <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode" style="margin-top:8px;"/>
          <p class="wz-mono">${totp.totpSecretEncoded}</p>
        </li>
        <li>
          <p class="wz-hint" style="font-size:13px;color:var(--wz-ink-2);">${msg("loginTotpStep3")}</p>
        </li>
      </ol>

      <#if messagesPerField.existsError('totp')>
        <span class="wz-error-text" aria-live="polite">${kcSanitize(messagesPerField.get('totp'))?no_esc}</span>
      </#if>

      <form class="wz-form" action="${url.loginAction}" id="kc-totp-settings-form" method="post">
        <input type="hidden" id="totp" name="totp" autocomplete="off" />
        <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />

        <div class="wz-field">
          <span class="wz-otp-head">${msg("loginTotpOneTime")}</span>
          <div class="wz-otp<#if messagesPerField.existsError('totp')> wz-otp-error</#if>" data-otp-target="totp">
            <input type="text" inputmode="numeric" id="first" maxlength="1" autofocus />
            <input type="text" inputmode="numeric" id="second" maxlength="1" />
            <input type="text" inputmode="numeric" id="third" maxlength="1" />
            <input type="text" inputmode="numeric" id="fourth" maxlength="1" />
            <input type="text" inputmode="numeric" id="fifth" maxlength="1" />
            <input type="text" inputmode="numeric" id="sixth" maxlength="1" />
          </div>
        </div>

        <button type="submit" class="wz-btn" style="background-color:#4f46d6;color:#fff;">${msg("doSubmit")}</button>
      </form>
    </div>
  </#if>
</@layout.registrationLayout>
