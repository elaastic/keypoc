<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
            "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

        <head>
            <meta charset="utf-8">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="robots" content="noindex, nofollow">

            <title><#nested "title"></title>
            <#if properties.stylesCommon?has_content>
                <#list properties.stylesCommon?split(' ') as style>
                    <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet"/>
                </#list>
            </#if>
            <#if properties.styles?has_content>
                <#list properties.styles?split(' ') as style>
                    <link href="${url.resourcesPath}/${style}" rel="stylesheet"/>
                </#list>
            </#if>
            <#if properties.scripts?has_content>
                <#list properties.scripts?split(' ') as script>
                    <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
                </#list>
            </#if>
            <link rel="icon" href="${url.resourcesPath}/img/favicon.ico"/>
        </head>

        <body>
        <#nested "header">
        <div class="login-content"
             style="background-image: url(&quot;${url.resourcesPath}/img/elaastic_background.jpg&quot;);">
            <div class="box">
                <#nested "form">
            </div>
        </div>
        </body>
    </html>
</#macro>
