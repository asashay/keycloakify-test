<!DOCTYPE html><html lang="en"><head><script>

Object.defineProperty(
    Object,
    "deepAssign",
    {
        "value": function callee(target, source) {
            Object.keys(source).forEach(function (key) {
                var value = source[key];
                if (target[key] === undefined) {
                    target[key] = value;
                    return;
                }
                if (value instanceof Object) {
                    if (value instanceof Array) {
                        value.forEach(function (entry) {
                            target[key].push(entry);
                        });
                        return;
                    }
                    callee(target[key], value);
                    return;
                }
                target[key] = value;
            });
            return target;
        }
    }
);
</script>
<script>

var es = /&(?:amp|#38|lt|#60|gt|#62|apos|#39|quot|#34);/g;

var unes = {
    '&amp;': '&',
    '&#38;': '&',
    '&lt;': '<',
    '&#60;': '<',
    '&gt;': '>',
    '&#62;': '>',
    '&apos;': "'",
    '&#39;': "'",
    '&quot;': '"',
    '&#34;': '"'
};
var cape = function (m) { return unes[m]; };

Object.defineProperty(
    String,
    "htmlUnescape",
    {
        "value": function (un) {
            return String.prototype.replace.call(un, es, cape);
        }
    }
);

</script>
<script>
    window.kcContext= Object.assign(
        {},
         
{
    "url": {
        "loginAction": (function (){

            <#attempt>
                return "${url.loginAction?no_esc}";
            <#recover>
            </#attempt>

        })(),
        "resourcesPath": (function (){

            <#attempt>
                return "${url.resourcesPath?no_esc}";
            <#recover>
            </#attempt>

        })(),
        "resourcesCommonPath": (function (){

            <#attempt>
                return "${url.resourcesCommonPath?no_esc}";
            <#recover>
            </#attempt>

        })(),
        "loginRestartFlowUrl": (function (){

            <#attempt>
                return "${url.loginRestartFlowUrl?no_esc}";
            <#recover>
            </#attempt>

        })(),
        "loginUrl": (function (){

            <#attempt>
                return "${url.loginUrl?no_esc}";
            <#recover>
            </#attempt>

        })()
    },
    "realm": {
        "displayName": (function (){

            <#attempt>
                return "${realm.displayName!''}" || undefined;
            <#recover>
            </#attempt>

        })(),
        "displayNameHtml": (function (){

            <#attempt>
                return "${realm.displayNameHtml!''}" || undefined;
            <#recover>
            </#attempt>

        })(),
        "internationalizationEnabled": (function (){

            <#attempt>
                return ${realm.internationalizationEnabled?c};
            <#recover>
            </#attempt>

        })(),
        "registrationEmailAsUsername": (function (){

            <#attempt>
                return ${realm.registrationEmailAsUsername?c};
            <#recover>
            </#attempt>

        })()
    },
    "locale": (function (){

        <#attempt>
            <#if realm.internationalizationEnabled>

                return {
                    "supported": (function(){

                        var out= [];

                        <#attempt>
                            <#list locale.supported as lng>
                                out.push({ 
                                    "url": (function (){

                                        <#attempt>
                                            return "${lng.url?no_esc}";
                                        <#recover>
                                        </#attempt>

                                    })(),
                                    "label": (function (){

                                        <#attempt>
                                            return "${lng.label}";
                                        <#recover>
                                        </#attempt>

                                    })(),
                                    "languageTag": (function (){

                                        <#attempt>
                                            return "${lng.languageTag}";
                                        <#recover>
                                        </#attempt>

                                    })()
                                });
                            </#list>
                        <#recover>
                        </#attempt>

                        return out;

                    })(),
                    "current": (function (){

                        <#attempt>
                            return "${locale.current}";
                        <#recover>
                        </#attempt>

                    })()
                };

            </#if>
        <#recover>
        </#attempt>

    })(),
    "auth": (function (){

        <#attempt>
        <#if auth?has_content>

            var out= {
                "showUsername": (function (){

                    <#attempt>
                        return ${auth.showUsername()?c};
                    <#recover>
                    </#attempt>

                })(),
                "showResetCredentials": (function (){

                    <#attempt>
                        return ${auth.showResetCredentials()?c};
                    <#recover>
                    </#attempt>

                })(),
                "showTryAnotherWayLink": (function(){

                    <#attempt>
                        return ${auth.showTryAnotherWayLink()?c};
                    <#recover>
                    </#attempt>

                })()
            };

            <#attempt>
            <#if auth.showUsername() && !auth.showResetCredentials()>
                Object.assign(
                    out,
                    {
                        "attemptedUsername": (function (){
                            <#attempt>
                                return "${auth.attemptedUsername}";
                            <#recover>
                            </#attempt>
                        })()
                    }
                );
            </#if>
            <#recover>
            </#attempt>

            return out;

        </#if>
        <#recover>
        </#attempt>

    })(),
    "scripts": (function(){

        var out = [];

        <#attempt>
            <#if scripts??>
                <#attempt>
                    <#list scripts as script>
                        out.push((function (){

                            <#attempt>
                                return "${script}";
                            <#recover>
                            </#attempt>

                        })());
                    </#list>
                <#recover>
                </#attempt>
            </#if>
        <#recover>
        </#attempt>

        return out;

    })(),
    "message": (function (){

        <#attempt>
            <#if message?has_content>

                return { 
                    "type": (function (){

                        <#attempt>
                            return "${message.type}";
                        <#recover>
                        </#attempt>

                    })(),
                    "summary": (function (){

                        <#attempt>
                            return String.htmlUnescape("${message.summary}");
                        <#recover>
                        </#attempt>

                    })()
                };

            </#if>
        <#recover>
        </#attempt>

    })(),
    "isAppInitiatedAction": (function (){

        <#attempt>
            <#if isAppInitiatedAction??>
                return true;
            </#if>
        <#recover>
        </#attempt>

        return false;

    })()
}

    );
</script>

<script>
    Object.deepAssign(
        window.kcContext,
        { "pageId": "login-otp.ftl" }
    );
    Object.deepAssign(
        window.kcContext,
         
{
    "otpLogin": {
        "userOtpCredentials": (function(){

            var out = [];

            <#attempt>
                <#list otpLogin.userOtpCredentials as otpCredential>
                    out.push({
                        "id": (function (){

                            <#attempt>
                                return "${otpCredential.id}";
                            <#recover>
                            </#attempt>

                        })(),
                        "userLabel": (function (){

                            <#attempt>
                                return "${otpCredential.userLabel}";
                            <#recover>
                            </#attempt>

                        })()
                    });
                </#list>
            <#recover>
            </#attempt>

            return out;

        })()
    }
}

    );
</script>

<#if scripts??>
    <#list scripts as script>
        <script src="${script}" type="text/javascript"></script>
    </#list>
</#if><meta charset="utf-8"><link rel="icon" href="${url.resourcesPath}/build/favicon.ico"><meta name="viewport" content="width=device-width,initial-scale=1"><meta name="theme-color" content="#000000"><meta name="description" content="Web site created using create-react-app"><link rel="apple-touch-icon" href="${url.resourcesPath}/build/logo192.png"><link rel="manifest" href="${url.resourcesPath}/build/manifest.json"><title>React App</title><link href="${url.resourcesPath}/build/static/css/main.8c8b27cf.chunk.css" rel="stylesheet"></head><body><noscript>You need to enable JavaScript to run this app.</noscript><div id="root"></div><script>!function(e){function t(t){for(var n,i,a=t[0],c=t[1],l=t[2],s=0,p=[];s<a.length;s++)i=a[s],Object.prototype.hasOwnProperty.call(o,i)&&o[i]&&p.push(o[i][0]),o[i]=0;for(n in c)Object.prototype.hasOwnProperty.call(c,n)&&(e[n]=c[n]);for(f&&f(t);p.length;)p.shift()();return u.push.apply(u,l||[]),r()}function r(){for(var e,t=0;t<u.length;t++){for(var r=u[t],n=!0,a=1;a<r.length;a++){var c=r[a];0!==o[c]&&(n=!1)}n&&(u.splice(t--,1),e=i(i.s=r[0]))}return e}var n={},o={1:0},u=[];function i(t){if(n[t])return n[t].exports;var r=n[t]={i:t,l:!1,exports:{}};return e[t].call(r.exports,r,r.exports,i),r.l=!0,r.exports}i.e=function(e){var t=[],r=o[e];if(0!==r)if(r)t.push(r[2]);else{var n=new Promise((function(t,n){r=o[e]=[t,n]}));t.push(r[2]=n);var u,a=document.createElement("script");a.charset="utf-8",a.timeout=120,i.nc&&a.setAttribute("nonce",i.nc),a.src=function(e){return window.kcContext.url.resourcesPath + "/build/static/js/"+({}[e]||e)+"."+{3:"fcecb288"}[e]+".chunk.js"}(e);var c=new Error;u=function(t){a.onerror=a.onload=null,clearTimeout(l);var r=o[e];if(0!==r){if(r){var n=t&&("load"===t.type?"missing":t.type),u=t&&t.target&&t.target.src;c.message="Loading chunk "+e+" failed.\n("+n+": "+u+")",c.name="ChunkLoadError",c.type=n,c.request=u,r[1](c)}o[e]=void 0}};var l=setTimeout((function(){u({type:"timeout",target:a})}),12e4);a.onerror=a.onload=u,document.head.appendChild(a)}return Promise.all(t)},i.m=e,i.c=n,i.d=function(e,t,r){i.o(e,t)||Object.defineProperty(e,t,{enumerable:!0,get:r})},i.r=function(e){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},i.t=function(e,t){if(1&t&&(e=i(e)),8&t)return e;if(4&t&&"object"==typeof e&&e&&e.__esModule)return e;var r=Object.create(null);if(i.r(r),Object.defineProperty(r,"default",{enumerable:!0,value:e}),2&t&&"string"!=typeof e)for(var n in e)i.d(r,n,function(t){return e[t]}.bind(null,n));return r},i.n=function(e){var t=e&&e.__esModule?function(){return e.default}:function(){return e};return i.d(t,"a",t),t},i.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)},i.p="/",i.oe=function(e){throw console.error(e),e};var a=this["webpackJsonpkeycloakify-test"]=this["webpackJsonpkeycloakify-test"]||[],c=a.push.bind(a);a.push=t,a=a.slice();for(var l=0;l<a.length;l++)t(a[l]);var f=c;r()}([])</script><script src="${url.resourcesPath}/build/static/js/2.7a9538b7.chunk.js"></script><script src="${url.resourcesPath}/build/static/js/main.b6da69d8.chunk.js"></script></body></html>