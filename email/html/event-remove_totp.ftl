<#import "template.ftl" as layout>
<@layout.emailLayout badgeType="alert"; section>
    <#if section = "text">
        <p style="margin:0 0 16px;">${msg("eventRemoveTotpBodyHtml")?no_esc}</p>
        <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:100%; background-color:#211b38; border-radius:10px;">
          <tr>
            <td style="padding:14px 16px;">
              <table role="presentation" cellpadding="0" cellspacing="0" border="0" style="width:100%; font-family:Helvetica,Arial,sans-serif;">
                <tr>
                  <td style="color:#8b83a8; font-size:12px; padding:3px 0;">${msg("emailMetaDate")}</td>
                  <td align="right" style="color:#e4e0f5; font-size:12px; font-weight:600; padding:3px 0;">${event.date}</td>
                </tr>
                <tr>
                  <td style="color:#8b83a8; font-size:12px; padding:3px 0;">${msg("emailMetaIp")}</td>
                  <td align="right" style="color:#e4e0f5; font-size:12px; font-weight:600; padding:3px 0;">${event.ipAddress}</td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
    </#if>
</@layout.emailLayout>
