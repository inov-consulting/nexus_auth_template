<#macro htmlEmailLayout>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    .HereIsWhereTheHappens{
      width: auto; max-width: 600px; margin: auto; background-color: #fff; padding: 10px;
    }

    .Hero {
      width: calc(100%);
      background-color: #256B3F;
      padding-top:25px;
      padding-bottom:25px
    }

    .Frame18{
      padding: 15px; width: 200px !important;
      background-color: #fff;
      margin:auto;
      border-radius:8px
    }

    .Content{
      font-family: Roboto;
      font-size: 12pt;
      color: #666;
      padding: 20px 20px 50px 20px
    }

    .Button{
      border-radius: 5px;
      background-color:#256B3F ;
      color: #fff !important;
      margin-top: 50px;
      padding: 10px 30px 10px 30px;
      min-width: 250px;
      text-decoration: none;
    }
    .Button:hover{
      background-color: #308e53;
    }

  </style>
</head>
<body style="background-color:#F2F2F2; padding-bottom: 50px; padding-top: 30px"  >

<div class="HereIsWhereTheHappens">
  <div class="Hero">
    <p style="text-align: center; margin: auto">
      <div class="Frame18">
      <div class="flex items-center gap-2 md:gap-2 lg:gap-3">
        <img src="https://minio.storage.esigmap.dev/esigmap/sigle.png" width="20" height="20"/>
        <div class="slogan flex-col uppercase xl:flex 2xl:flex">
          <div class="flex flex-col leading-none">
            <span class="font-medium" :class="[textColor, textSize]"
              >${msg("portalOfThe")}</span
            >
            <span class="font-medium" :class="[textColor, textSize]">
                ${msg("publicOrder")}
            </span>
          </div>
          <div class="w-full h-1 flex items-center justify-between mt-0.5">
            <span class="h-full w-1/3 bg-green-600"></span>
            <span
              class="h-full w-1/3 bg-yellow-400 flex items-center justify-center"
            >
              <Icon name="ri:star-fill" size="4" class="text-primary" />
            </span>
            <span class="h-full w-1/3 bg-red-600"></span>
          </div>
          <span class="font-medium" :class="[textColor, textSize]"
            >${msg("republicSenegal")}</span
          >
        </div>
      </div>
      </div>
    </p>
  </div>
  <div class="Content">
      <#nested "text">
      <#if link??>
          <#nested "linkText">
      <#--        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="text-white w-6 h-6">-->
      <#--          <path stroke-linecap="round" stroke-linejoin="round" d="M13.5 4.5L21 12m0 0l-7.5 7.5M21 12H3" />-->
      <#--        </svg>-->

      </#if>
  </div>
</div>

<p style="text-align: center; color: #888">© 2023 Esigmap Dakar - Sénégal.</p>
</body>
</html>
</#macro>
