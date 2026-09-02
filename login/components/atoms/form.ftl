<#macro kw rest...>
  <form
    class="m-0 space-y-4 wz-form"

    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </form>
</#macro>
