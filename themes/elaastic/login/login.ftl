<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
<#if section = "title">
${msg("loginTitle",(realm.displayName!''))}
<#elseif section = "header">
    <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
    <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
<#elseif section = "form">
<div>
    <img class="logo" src="${url.resourcesPath}/img/elaastic_logo_rvb.png" alt="Logo of elaastic">
</div>
<div class="box-container">
    <#if realm.password>
        <div>
            <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username">
                <input id="password" class="login-field" placeholder="${msg("password")}" type="password"
                       name="password">
                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
            </form>
        </div>
    </#if>
    <#if realm.password && social?? && social.providers?has_content>
        <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
            <div class="alternate-wrapper">
                <span spacing="16" class="separator"></span>
                <div class="login-alternate-spacer"></div>
                <span data-cy="text" font-size="16px" font-weight="400" class="login-alternate">${msg("or")}</span>
                <div class="login-alternate-spacer"></div>
                <span spacing="16" class="separator"></span>
            </div>

            <div class="social-providers">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}"
                               class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                               type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </div>
    </#if>
    <script>
        <#list properties?keys as key>
        console.log("key: ${key}, value: ${properties[key]!}");
        </#list>
    </script>
    </#if>
    </@layout.registrationLayout>
