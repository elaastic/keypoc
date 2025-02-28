package com.elaastic.keypoc

import org.springframework.security.core.Authentication
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken
import org.springframework.security.oauth2.core.oidc.user.OidcUser
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.GetMapping


@Controller
class UiController {

    @GetMapping("/")
    fun getIndex(model: Model, auth: Authentication?): String {

        model["name"] =
            if (auth is OAuth2AuthenticationToken && auth.principal is OidcUser) (auth.principal as OidcUser).preferredUsername
            else ""
        model["isAuthenticated"] = auth?.isAuthenticated ?: false
        auth?.let {
            model["isNice"] = auth.authorities.any { it.authority == "NICE" }
        }
        return "index.html";
    }

    @GetMapping("/nice")
    fun getNice(model: Model, auth: Authentication?) = "nice.html";

}