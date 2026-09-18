<#include "logo-base64.ftl">
<#macro htmlEmailLayout badgeType="">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="color-scheme" content="dark light">
  <title>Plexis</title>
</head>
<body style="margin:0; padding:0; background-color:#0f0b1a;">
  <table role="presentation" width="100%" cellpadding="0" cellspacing="0" border="0" style="background-color:#0f0b1a;">
    <tr>
      <td align="center" style="padding:32px 16px;">
        <table role="presentation" width="600" cellpadding="0" cellspacing="0" border="0" style="max-width:600px; width:100%; background-color:#181329; border-radius:16px; overflow:hidden;">

          <!-- Header -->
          <tr>
            <td style="background-color:#4a2fd4; padding:20px 32px;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0">
                <tr>
                  <td style="background-color:#ffffff; border-radius:10px; padding:8px 14px;">
                    <img src="data:image/png;base64,${logoPlexisBase64}" height="22" alt="Plexis" style="display:block; border:0; height:22px;" />
                  </td>
                </tr>
              </table>
            </td>
          </tr>

          <!-- Body -->
          <tr>
            <td style="padding:32px; font-family:Helvetica,Arial,sans-serif;">

              <#if badgeType == "single-use">
                <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin-bottom:20px;">
                  <tr>
                    <td style="background-color:#3a2418; border-radius:999px; padding:7px 14px;">
                      <span style="color:#f0a868; font-size:11px; font-weight:700; letter-spacing:.04em; text-transform:uppercase; font-family:Helvetica,Arial,sans-serif;">&#9888; ${msg("emailBadgeSingleUse")}</span>
                    </td>
                  </tr>
                </table>
              <#elseif badgeType == "alert">
                <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin-bottom:20px;">
                  <tr>
                    <td style="background-color:#3a1e1e; border-radius:999px; padding:7px 14px;">
                      <span style="color:#f0a0a0; font-size:11px; font-weight:700; letter-spacing:.04em; text-transform:uppercase; font-family:Helvetica,Arial,sans-serif;">&#9888; ${msg("emailBadgeSecurityAlert")}</span>
                    </td>
                  </tr>
                </table>
              </#if>

              <p style="margin:0 0 16px; color:#ffffff; font-size:16px; font-weight:600; font-family:Helvetica,Arial,sans-serif;">${msg("emailGreeting", (user.firstName)!'')}</p>

              <div style="color:#c9c3e0; font-size:14px; line-height:1.6; font-family:Helvetica,Arial,sans-serif;">
                <#nested "text">
              </div>

              <#if link??>
                <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="margin:24px 0 8px;">
                  <tr>
                    <td style="background-color:#4a2fd4; border-radius:10px;">
                      <a href="${link}" target="_blank" style="display:inline-block; padding:13px 28px; color:#ffffff; font-size:14px; font-weight:600; font-family:Helvetica,Arial,sans-serif; text-decoration:none;"><#nested "linkText"></a>
                    </td>
                  </tr>
                </table>
                <p style="margin:16px 0 0; color:#6b6389; font-size:11px; line-height:1.6; font-family:Helvetica,Arial,sans-serif;">
                  ${msg("emailCtaFallback")}<br/>
                  <a href="${link}" target="_blank" style="color:#8f7fe8; word-break:break-all;">${link}</a>
                </p>
              </#if>

            </td>
          </tr>

          <!-- Footer -->
          <tr>
            <td style="padding:20px 32px; border-top:1px solid #2a2340;">
              <p style="margin:0; color:#8b83a8; font-size:12px; font-family:Helvetica,Arial,sans-serif;">${msg("emailFooterSentBy")} &middot; ${.now?string("d MMMM yyyy")}</p>
              <p style="margin:6px 0 0; color:#6b6389; font-size:11px; font-family:Helvetica,Arial,sans-serif;">${msg("emailFooterNoReply")}</p>
            </td>
          </tr>

        </table>
      </td>
    </tr>
  </table>
</body>
</html>
</#macro>
