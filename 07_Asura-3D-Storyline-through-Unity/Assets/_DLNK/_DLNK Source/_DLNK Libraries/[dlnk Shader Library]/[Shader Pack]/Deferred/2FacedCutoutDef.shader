// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.17 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.17;sub:START;pass:START;ps:flbk:Standard,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:True,hqlp:False,rprd:True,enco:False,rmgx:True,rpth:1,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,culm:2,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.3587191,fgcg:0.3438582,fgcb:0.3897059,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:479,x:32856,y:32637,varname:node_479,prsc:2|diff-1724-OUT,spec-9909-OUT,gloss-8352-OUT,normal-2662-OUT,emission-5287-OUT,lwrap-6216-OUT,amdfl-9821-OUT,difocc-7092-OUT,clip-153-OUT;n:type:ShaderForge.SFN_Multiply,id:1724,x:32521,y:32718,varname:node_1724,prsc:2|A-1237-RGB,B-9680-RGB;n:type:ShaderForge.SFN_Color,id:1237,x:32254,y:32615,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1237,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Color,id:5164,x:31642,y:33039,ptovrint:False,ptlb:EmissionColor,ptin:_EmissionColor,varname:_Color_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Tex2d,id:9680,x:32092,y:32771,ptovrint:False,ptlb:Main Tex,ptin:_MainTex,varname:node_9680,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_SwitchProperty,id:1403,x:32293,y:32831,ptovrint:False,ptlb:Use Alpha,ptin:_UseAlpha,varname:node_1403,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5657-A,B-9680-A;n:type:ShaderForge.SFN_Tex2d,id:5657,x:32073,y:32966,ptovrint:False,ptlb:Opacity Map,ptin:_OpacityMap,varname:node_5657,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Clamp01,id:153,x:32673,y:32919,varname:node_153,prsc:2|IN-7662-OUT;n:type:ShaderForge.SFN_Multiply,id:7662,x:32511,y:32919,varname:node_7662,prsc:2|A-1403-OUT,B-822-OUT;n:type:ShaderForge.SFN_ValueProperty,id:822,x:32327,y:33093,ptovrint:False,ptlb:Cutoff,ptin:_Cutoff,varname:node_822,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Tex2d,id:9841,x:32351,y:33183,ptovrint:False,ptlb:Occlusion Map,ptin:_OcclusionMap,varname:node_9841,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b12ca1b0c12efad45aa846dbcc7baf3d,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9678,x:31642,y:33204,ptovrint:False,ptlb:Emission Map,ptin:_EmissionMap,varname:node_9678,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:8006,x:31627,y:32511,ptovrint:False,ptlb:Bump Map,ptin:_BumpMap,varname:node_8006,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_Slider,id:2028,x:32451,y:32438,ptovrint:False,ptlb:Metallic,ptin:_Metallic,varname:node_2028,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Slider,id:7436,x:32451,y:32532,ptovrint:False,ptlb:Glossiness,ptin:_Glossiness,varname:_Metallic_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2,max:1;n:type:ShaderForge.SFN_Multiply,id:20,x:32603,y:33183,varname:node_20,prsc:2|A-9841-R,B-3117-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3117,x:32351,y:33355,ptovrint:False,ptlb:Occlusion Strenght,ptin:_OcclusionStrenght,varname:node_3117,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:1262,x:31642,y:33391,ptovrint:False,ptlb:Emission LM,ptin:_EmissionLM,varname:node_1262,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Multiply,id:5287,x:31839,y:33257,varname:node_5287,prsc:2|A-5164-RGB,B-9678-RGB,C-1262-OUT,D-9678-A;n:type:ShaderForge.SFN_ValueProperty,id:6216,x:32917,y:33141,ptovrint:False,ptlb:Light Wrap,ptin:_LightWrap,varname:node_6216,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:8648,x:32862,y:33551,ptovrint:False,ptlb:Fresnel,ptin:_Fresnel,varname:node_8648,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Fresnel,id:6007,x:32862,y:33392,varname:node_6007,prsc:2|EXP-8648-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3133,x:33017,y:33392,ptovrint:False,ptlb:Rim Power,ptin:_RimPower,varname:_Fresnel_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Color,id:4976,x:33017,y:33478,ptovrint:False,ptlb:Rim Color,ptin:_RimColor,varname:node_4976,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:1308,x:32863,y:33249,varname:node_1308,prsc:2|A-3133-OUT,B-6007-OUT,C-4976-RGB,D-7092-OUT;n:type:ShaderForge.SFN_AmbientLight,id:1590,x:33089,y:32825,varname:node_1590,prsc:2;n:type:ShaderForge.SFN_Add,id:9821,x:33208,y:33023,varname:node_9821,prsc:2|A-1308-OUT,B-1590-RGB;n:type:ShaderForge.SFN_Clamp01,id:7092,x:32603,y:33327,varname:node_7092,prsc:2|IN-20-OUT;n:type:ShaderForge.SFN_Multiply,id:9909,x:32836,y:32303,varname:node_9909,prsc:2|A-2725-R,B-2028-OUT;n:type:ShaderForge.SFN_Multiply,id:8352,x:32847,y:32465,varname:node_8352,prsc:2|A-5300-OUT,B-7436-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5300,x:32608,y:32280,ptovrint:False,ptlb:Metal Alpha Gloss,ptin:_MetalAlphaGloss,varname:node_5300,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-1185-R,B-2725-A;n:type:ShaderForge.SFN_Tex2d,id:1185,x:32443,y:32131,ptovrint:False,ptlb:Smoothness Map,ptin:_SmoothnessMap,varname:node_1185,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:2725,x:32278,y:32227,ptovrint:False,ptlb:Metallic Gloss Map,ptin:_MetallicGlossMap,varname:node_2725,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Lerp,id:2662,x:31907,y:32538,varname:node_2662,prsc:2|A-8920-OUT,B-8006-RGB,T-6239-OUT;n:type:ShaderForge.SFN_Vector3,id:8920,x:31627,y:32683,varname:node_8920,prsc:2,v1:0,v2:0,v3:1;n:type:ShaderForge.SFN_ValueProperty,id:6239,x:31627,y:32811,ptovrint:False,ptlb:Bump Scale,ptin:_BumpScale,varname:node_6239,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;proporder:1237-9680-1403-822-2028-2725-5300-7436-1185-8006-6239-5657-9841-3117-5164-9678-1262-6216-8648-3133-4976;pass:END;sub:END;*/

Shader "DLNK/Deferred/2FacedTransparent" {
    Properties {
        _Color ("Color", Color) = (0.5,0.5,0.5,1)
        _MainTex ("Main Tex", 2D) = "white" {}
        [MaterialToggle] _UseAlpha ("Use Alpha", Float ) = 1
        _Cutoff ("Cutoff", Float ) = 0.5
        _Metallic ("Metallic", Range(0, 1)) = 0
        _MetallicGlossMap ("Metallic Gloss Map", 2D) = "white" {}
        [MaterialToggle] _MetalAlphaGloss ("Metal Alpha Gloss", Float ) = 1
        _Glossiness ("Glossiness", Range(0, 1)) = 0.2
        _SmoothnessMap ("Smoothness Map", 2D) = "white" {}
        _BumpMap ("Bump Map", 2D) = "bump" {}
        _BumpScale ("Bump Scale", Float ) = 1
        _OpacityMap ("Opacity Map", 2D) = "white" {}
        _OcclusionMap ("Occlusion Map", 2D) = "white" {}
        _OcclusionStrenght ("Occlusion Strenght", Float ) = 1
        _EmissionColor ("EmissionColor", Color) = (0.5,0.5,0.5,1)
        _EmissionMap ("Emission Map", 2D) = "white" {}
        _EmissionLM ("Emission LM", Float ) = 0
        _LightWrap ("Light Wrap", Float ) = 0
        _Fresnel ("Fresnel", Float ) = 0
        _RimPower ("Rim Power", Float ) = 0
        _RimColor ("Rim Color", Color) = (0.5,0.5,0.5,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 200
        Pass {
            Name "DEFERRED"
            Tags {
                "LightMode"="Deferred"
            }
            Cull Off
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_DEFERRED
            #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
            #define _GLOSSYENV 1
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile ___ UNITY_HDR_ON
            #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
            #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
            #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
            #pragma multi_compile_fog
            #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _Color;
            uniform float4 _EmissionColor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform fixed _UseAlpha;
            uniform sampler2D _OpacityMap; uniform float4 _OpacityMap_ST;
            uniform float _Cutoff;
            uniform sampler2D _OcclusionMap; uniform float4 _OcclusionMap_ST;
            uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
            uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
            uniform float _Metallic;
            uniform float _Glossiness;
            uniform float _OcclusionStrenght;
            uniform float _EmissionLM;
            uniform float _LightWrap;
            uniform float _Fresnel;
            uniform float _RimPower;
            uniform float4 _RimColor;
            uniform fixed _MetalAlphaGloss;
            uniform sampler2D _SmoothnessMap; uniform float4 _SmoothnessMap_ST;
            uniform sampler2D _MetallicGlossMap; uniform float4 _MetallicGlossMap_ST;
            uniform float _BumpScale;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
                float2 texcoord2 : TEXCOORD2;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float2 uv1 : TEXCOORD1;
                float2 uv2 : TEXCOORD2;
                float4 posWorld : TEXCOORD3;
                float3 normalDir : TEXCOORD4;
                float3 tangentDir : TEXCOORD5;
                float3 bitangentDir : TEXCOORD6;
                #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                    float4 ambientOrLightmapUV : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.uv1 = v.texcoord1;
                o.uv2 = v.texcoord2;
                #ifdef LIGHTMAP_ON
                    o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.ambientOrLightmapUV.zw = 0;
                #elif UNITY_SHOULD_SAMPLE_SH
            #endif
            #ifdef DYNAMICLIGHTMAP_ON
                o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
            #endif
            o.normalDir = UnityObjectToWorldNormal(v.normal);
            o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
            o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
            o.posWorld = mul(unity_ObjectToWorld, v.vertex);
            o.pos = UnityObjectToClipPos(v.vertex);
            return o;
        }
        void frag(
            VertexOutput i,
            out half4 outDiffuse : SV_Target0,
            out half4 outSpecSmoothness : SV_Target1,
            out half4 outNormal : SV_Target2,
            out half4 outEmission : SV_Target3 )
        {
            i.normalDir = normalize(i.normalDir);
            float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
/// Vectors:
            float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
            float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
            float3 normalLocal = lerp(float3(0,0,1),_BumpMap_var.rgb,_BumpScale);
            float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
            
            float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
            i.normalDir *= nSign;
            normalDirection *= nSign;
            
            float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
            float4 _OpacityMap_var = tex2D(_OpacityMap,TRANSFORM_TEX(i.uv0, _OpacityMap));
            float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
            clip(saturate((lerp( _OpacityMap_var.a, _MainTex_var.a, _UseAlpha )*_Cutoff)) - 0.5);
// Lighting:
            float Pi = 3.141592654;
            float InvPi = 0.31830988618;
///// Gloss:
            float4 _SmoothnessMap_var = tex2D(_SmoothnessMap,TRANSFORM_TEX(i.uv0, _SmoothnessMap));
            float4 _MetallicGlossMap_var = tex2D(_MetallicGlossMap,TRANSFORM_TEX(i.uv0, _MetallicGlossMap));
            float gloss = (lerp( _SmoothnessMap_var.r, _MetallicGlossMap_var.a, _MetalAlphaGloss )*_Glossiness);
/// GI Data:
            UnityLight light; // Dummy light
            light.color = 0;
            light.dir = half3(0,1,0);
            light.ndotl = max(0,dot(normalDirection,light.dir));
            UnityGIInput d;
            d.light = light;
            d.worldPos = i.posWorld.xyz;
            d.worldViewDir = viewDirection;
            d.atten = 1;
            #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
                d.ambient = 0;
                d.lightmapUV = i.ambientOrLightmapUV;
            #else
                d.ambient = i.ambientOrLightmapUV;
            #endif
            d.boxMax[0] = unity_SpecCube0_BoxMax;
            d.boxMin[0] = unity_SpecCube0_BoxMin;
            d.probePosition[0] = unity_SpecCube0_ProbePosition;
            d.probeHDR[0] = unity_SpecCube0_HDR;
            d.boxMax[1] = unity_SpecCube1_BoxMax;
            d.boxMin[1] = unity_SpecCube1_BoxMin;
            d.probePosition[1] = unity_SpecCube1_ProbePosition;
            d.probeHDR[1] = unity_SpecCube1_HDR;
            UnityGI gi = UnityGlobalIllumination (d, 1, gloss, normalDirection);
// Specular:
            float3 diffuseColor = (_Color.rgb*_MainTex_var.rgb); // Need this for specular when using metallic
            float specularMonochrome;
            float3 specularColor;
            diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, (_MetallicGlossMap_var.r*_Metallic), specularColor, specularMonochrome );
            specularMonochrome = 1-specularMonochrome;
            float NdotV = max(0.0,dot( normalDirection, viewDirection ));
            half grazingTerm = saturate( gloss + specularMonochrome );
            float3 indirectSpecular = (gi.indirect.specular);
            indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
/// Diffuse:
            float3 indirectDiffuse = float3(0,0,0);
            float4 _OcclusionMap_var = tex2D(_OcclusionMap,TRANSFORM_TEX(i.uv0, _OcclusionMap));
            float node_7092 = saturate((_OcclusionMap_var.r*_OcclusionStrenght));
            indirectDiffuse += ((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel)*_RimColor.rgb*node_7092)+UNITY_LIGHTMODEL_AMBIENT.rgb); // Diffuse Ambient Light
            indirectDiffuse += gi.indirect.diffuse;
            indirectDiffuse *= node_7092; // Diffuse AO
// Emissive:
            float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
            float3 emissive = (_EmissionColor.rgb*_EmissionMap_var.rgb*_EmissionLM*_EmissionMap_var.a);
// Final Color:
            outDiffuse = half4( diffuseColor, node_7092 );
            outSpecSmoothness = half4( specularColor, gloss );
            outNormal = half4( normalDirection * 0.5 + 0.5, 1 );
            outEmission = half4( (_EmissionColor.rgb*_EmissionMap_var.rgb*_EmissionLM*_EmissionMap_var.a), 1 );
            outEmission.rgb += indirectSpecular * 1;
            outEmission.rgb += indirectDiffuse * diffuseColor;
            #ifndef UNITY_HDR_ON
                outEmission.rgb = exp2(-outEmission.rgb);
            #endif
        }
        ENDCG
    }
    Pass {
        Name "FORWARD"
        Tags {
            "LightMode"="ForwardBase"
        }
        Cull Off
        
        
        CGPROGRAM
        #pragma vertex vert
        #pragma fragment frag
        #define UNITY_PASS_FORWARDBASE
        #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
        #define _GLOSSYENV 1
        #include "UnityCG.cginc"
        #include "AutoLight.cginc"
        #include "Lighting.cginc"
        #include "UnityPBSLighting.cginc"
        #include "UnityStandardBRDF.cginc"
        #pragma multi_compile_fwdbase_fullshadows
        #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
        #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
        #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
        #pragma multi_compile_fog
        #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
        #pragma target 3.0
        uniform float4 _Color;
        uniform float4 _EmissionColor;
        uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
        uniform fixed _UseAlpha;
        uniform sampler2D _OpacityMap; uniform float4 _OpacityMap_ST;
        uniform float _Cutoff;
        uniform sampler2D _OcclusionMap; uniform float4 _OcclusionMap_ST;
        uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
        uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
        uniform float _Metallic;
        uniform float _Glossiness;
        uniform float _OcclusionStrenght;
        uniform float _EmissionLM;
        uniform float _LightWrap;
        uniform float _Fresnel;
        uniform float _RimPower;
        uniform float4 _RimColor;
        uniform fixed _MetalAlphaGloss;
        uniform sampler2D _SmoothnessMap; uniform float4 _SmoothnessMap_ST;
        uniform sampler2D _MetallicGlossMap; uniform float4 _MetallicGlossMap_ST;
        uniform float _BumpScale;
        struct VertexInput {
            float4 vertex : POSITION;
            float3 normal : NORMAL;
            float4 tangent : TANGENT;
            float2 texcoord0 : TEXCOORD0;
            float2 texcoord1 : TEXCOORD1;
            float2 texcoord2 : TEXCOORD2;
        };
        struct VertexOutput {
            float4 pos : SV_POSITION;
            float2 uv0 : TEXCOORD0;
            float2 uv1 : TEXCOORD1;
            float2 uv2 : TEXCOORD2;
            float4 posWorld : TEXCOORD3;
            float3 normalDir : TEXCOORD4;
            float3 tangentDir : TEXCOORD5;
            float3 bitangentDir : TEXCOORD6;
            LIGHTING_COORDS(7,8)
            UNITY_FOG_COORDS(9)
            #if defined(LIGHTMAP_ON) || defined(UNITY_SHOULD_SAMPLE_SH)
                float4 ambientOrLightmapUV : TEXCOORD10;
            #endif
        };
        VertexOutput vert (VertexInput v) {
            VertexOutput o = (VertexOutput)0;
            o.uv0 = v.texcoord0;
            o.uv1 = v.texcoord1;
            o.uv2 = v.texcoord2;
            #ifdef LIGHTMAP_ON
                o.ambientOrLightmapUV.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                o.ambientOrLightmapUV.zw = 0;
            #elif UNITY_SHOULD_SAMPLE_SH
        #endif
        #ifdef DYNAMICLIGHTMAP_ON
            o.ambientOrLightmapUV.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
        #endif
        o.normalDir = UnityObjectToWorldNormal(v.normal);
        o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
        o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
        o.posWorld = mul(unity_ObjectToWorld, v.vertex);
        float3 lightColor = _LightColor0.rgb;
        o.pos = UnityObjectToClipPos(v.vertex);
        UNITY_TRANSFER_FOG(o,o.pos);
        TRANSFER_VERTEX_TO_FRAGMENT(o)
        return o;
    }
    float4 frag(VertexOutput i) : COLOR {
        i.normalDir = normalize(i.normalDir);
        float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
// Vectors:
        float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
        float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
        float3 normalLocal = lerp(float3(0,0,1),_BumpMap_var.rgb,_BumpScale);
        float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
        
        float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
        i.normalDir *= nSign;
        normalDirection *= nSign;
        
        float3 viewReflectDirection = reflect( -viewDirection, normalDirection );
        float4 _OpacityMap_var = tex2D(_OpacityMap,TRANSFORM_TEX(i.uv0, _OpacityMap));
        float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
        clip(saturate((lerp( _OpacityMap_var.a, _MainTex_var.a, _UseAlpha )*_Cutoff)) - 0.5);
        float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
        float3 lightColor = _LightColor0.rgb;
        float3 halfDirection = normalize(viewDirection+lightDirection);
// Lighting:
        float attenuation = LIGHT_ATTENUATION(i);
        float3 attenColor = attenuation * _LightColor0.xyz;
        float Pi = 3.141592654;
        float InvPi = 0.31830988618;
// Gloss:
        float4 _SmoothnessMap_var = tex2D(_SmoothnessMap,TRANSFORM_TEX(i.uv0, _SmoothnessMap));
        float4 _MetallicGlossMap_var = tex2D(_MetallicGlossMap,TRANSFORM_TEX(i.uv0, _MetallicGlossMap));
        float gloss = (lerp( _SmoothnessMap_var.r, _MetallicGlossMap_var.a, _MetalAlphaGloss )*_Glossiness);
        float specPow = exp2( gloss * 10.0+1.0);
// GI Data:
        UnityLight light;
        #ifdef LIGHTMAP_OFF
            light.color = lightColor;
            light.dir = lightDirection;
            light.ndotl = LambertTerm (normalDirection, light.dir);
        #else
            light.color = half3(0.f, 0.f, 0.f);
            light.ndotl = 0.0f;
            light.dir = half3(0.f, 0.f, 0.f);
        #endif
        UnityGIInput d;
        d.light = light;
        d.worldPos = i.posWorld.xyz;
        d.worldViewDir = viewDirection;
        d.atten = attenuation;
        #if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
            d.ambient = 0;
            d.lightmapUV = i.ambientOrLightmapUV;
        #else
            d.ambient = i.ambientOrLightmapUV;
        #endif
        d.boxMax[0] = unity_SpecCube0_BoxMax;
        d.boxMin[0] = unity_SpecCube0_BoxMin;
        d.probePosition[0] = unity_SpecCube0_ProbePosition;
        d.probeHDR[0] = unity_SpecCube0_HDR;
        d.boxMax[1] = unity_SpecCube1_BoxMax;
        d.boxMin[1] = unity_SpecCube1_BoxMin;
        d.probePosition[1] = unity_SpecCube1_ProbePosition;
        d.probeHDR[1] = unity_SpecCube1_HDR;
        UnityGI gi = UnityGlobalIllumination (d, 1, gloss, normalDirection);
        lightDirection = gi.light.dir;
        lightColor = gi.light.color;
// Specular:
        float NdotL = max(0, dot( normalDirection, lightDirection ));
        float LdotH = max(0.0,dot(lightDirection, halfDirection));
        float3 diffuseColor = (_Color.rgb*_MainTex_var.rgb); // Need this for specular when using metallic
        float specularMonochrome;
        float3 specularColor;
        diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, (_MetallicGlossMap_var.r*_Metallic), specularColor, specularMonochrome );
        specularMonochrome = 1-specularMonochrome;
        float NdotV = max(0.0,dot( normalDirection, viewDirection ));
        float NdotH = max(0.0,dot( normalDirection, halfDirection ));
        float VdotH = max(0.0,dot( viewDirection, halfDirection ));
        float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
        float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
        float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
        float3 directSpecular = 1 * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
        half grazingTerm = saturate( gloss + specularMonochrome );
        float3 indirectSpecular = (gi.indirect.specular);
        indirectSpecular *= FresnelLerp (specularColor, grazingTerm, NdotV);
        float3 specular = (directSpecular + indirectSpecular);
// Diffuse:
        NdotL = max(0.0,dot( normalDirection, lightDirection ));
        half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
        float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
        float3 indirectDiffuse = float3(0,0,0);
        float4 _OcclusionMap_var = tex2D(_OcclusionMap,TRANSFORM_TEX(i.uv0, _OcclusionMap));
        float node_7092 = saturate((_OcclusionMap_var.r*_OcclusionStrenght));
        indirectDiffuse += ((_RimPower*pow(1.0-max(0,dot(normalDirection, viewDirection)),_Fresnel)*_RimColor.rgb*node_7092)+UNITY_LIGHTMODEL_AMBIENT.rgb); // Diffuse Ambient Light
        indirectDiffuse += gi.indirect.diffuse;
        indirectDiffuse *= node_7092; // Diffuse AO
        float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
// Emissive:
        float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
        float3 emissive = (_EmissionColor.rgb*_EmissionMap_var.rgb*_EmissionLM*_EmissionMap_var.a);
// Final Color:
        float3 finalColor = diffuse + specular + emissive;
        fixed4 finalRGBA = fixed4(finalColor,1);
        UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
        return finalRGBA;
    }
    ENDCG
}
Pass {
    Name "FORWARD_DELTA"
    Tags {
        "LightMode"="ForwardAdd"
    }
    Blend One One
    Cull Off
    
    
    CGPROGRAM
    #pragma vertex vert
    #pragma fragment frag
    #define UNITY_PASS_FORWARDADD
    #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
    #define _GLOSSYENV 1
    #include "UnityCG.cginc"
    #include "AutoLight.cginc"
    #include "Lighting.cginc"
    #include "UnityPBSLighting.cginc"
    #include "UnityStandardBRDF.cginc"
    #pragma multi_compile_fwdadd_fullshadows
    #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
    #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
    #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
    #pragma multi_compile_fog
    #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
    #pragma target 3.0
    uniform float4 _Color;
    uniform float4 _EmissionColor;
    uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
    uniform fixed _UseAlpha;
    uniform sampler2D _OpacityMap; uniform float4 _OpacityMap_ST;
    uniform float _Cutoff;
    uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
    uniform sampler2D _BumpMap; uniform float4 _BumpMap_ST;
    uniform float _Metallic;
    uniform float _Glossiness;
    uniform float _EmissionLM;
    uniform float _LightWrap;
    uniform fixed _MetalAlphaGloss;
    uniform sampler2D _SmoothnessMap; uniform float4 _SmoothnessMap_ST;
    uniform sampler2D _MetallicGlossMap; uniform float4 _MetallicGlossMap_ST;
    uniform float _BumpScale;
    struct VertexInput {
        float4 vertex : POSITION;
        float3 normal : NORMAL;
        float4 tangent : TANGENT;
        float2 texcoord0 : TEXCOORD0;
        float2 texcoord1 : TEXCOORD1;
        float2 texcoord2 : TEXCOORD2;
    };
    struct VertexOutput {
        float4 pos : SV_POSITION;
        float2 uv0 : TEXCOORD0;
        float2 uv1 : TEXCOORD1;
        float2 uv2 : TEXCOORD2;
        float4 posWorld : TEXCOORD3;
        float3 normalDir : TEXCOORD4;
        float3 tangentDir : TEXCOORD5;
        float3 bitangentDir : TEXCOORD6;
        LIGHTING_COORDS(7,8)
    };
    VertexOutput vert (VertexInput v) {
        VertexOutput o = (VertexOutput)0;
        o.uv0 = v.texcoord0;
        o.uv1 = v.texcoord1;
        o.uv2 = v.texcoord2;
        o.normalDir = UnityObjectToWorldNormal(v.normal);
        o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
        o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
        o.posWorld = mul(unity_ObjectToWorld, v.vertex);
        float3 lightColor = _LightColor0.rgb;
        o.pos = UnityObjectToClipPos(v.vertex);
        TRANSFER_VERTEX_TO_FRAGMENT(o)
        return o;
    }
    float4 frag(VertexOutput i) : COLOR {
        i.normalDir = normalize(i.normalDir);
        float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
// Vectors:
        float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
        float3 _BumpMap_var = UnpackNormal(tex2D(_BumpMap,TRANSFORM_TEX(i.uv0, _BumpMap)));
        float3 normalLocal = lerp(float3(0,0,1),_BumpMap_var.rgb,_BumpScale);
        float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
        
        float nSign = sign( dot( viewDirection, i.normalDir ) ); // Reverse normal if this is a backface
        i.normalDir *= nSign;
        normalDirection *= nSign;
        
        float4 _OpacityMap_var = tex2D(_OpacityMap,TRANSFORM_TEX(i.uv0, _OpacityMap));
        float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
        clip(saturate((lerp( _OpacityMap_var.a, _MainTex_var.a, _UseAlpha )*_Cutoff)) - 0.5);
        float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
        float3 lightColor = _LightColor0.rgb;
        float3 halfDirection = normalize(viewDirection+lightDirection);
// Lighting:
        float attenuation = LIGHT_ATTENUATION(i);
        float3 attenColor = attenuation * _LightColor0.xyz;
        float Pi = 3.141592654;
        float InvPi = 0.31830988618;
// Gloss:
        float4 _SmoothnessMap_var = tex2D(_SmoothnessMap,TRANSFORM_TEX(i.uv0, _SmoothnessMap));
        float4 _MetallicGlossMap_var = tex2D(_MetallicGlossMap,TRANSFORM_TEX(i.uv0, _MetallicGlossMap));
        float gloss = (lerp( _SmoothnessMap_var.r, _MetallicGlossMap_var.a, _MetalAlphaGloss )*_Glossiness);
        float specPow = exp2( gloss * 10.0+1.0);
// Specular:
        float NdotL = max(0, dot( normalDirection, lightDirection ));
        float LdotH = max(0.0,dot(lightDirection, halfDirection));
        float3 diffuseColor = (_Color.rgb*_MainTex_var.rgb); // Need this for specular when using metallic
        float specularMonochrome;
        float3 specularColor;
        diffuseColor = DiffuseAndSpecularFromMetallic( diffuseColor, (_MetallicGlossMap_var.r*_Metallic), specularColor, specularMonochrome );
        specularMonochrome = 1-specularMonochrome;
        float NdotV = max(0.0,dot( normalDirection, viewDirection ));
        float NdotH = max(0.0,dot( normalDirection, halfDirection ));
        float VdotH = max(0.0,dot( viewDirection, halfDirection ));
        float visTerm = SmithBeckmannVisibilityTerm( NdotL, NdotV, 1.0-gloss );
        float normTerm = max(0.0, NDFBlinnPhongNormalizedTerm(NdotH, RoughnessToSpecPower(1.0-gloss)));
        float specularPBL = max(0, (NdotL*visTerm*normTerm) * unity_LightGammaCorrectionConsts_PIDiv4 );
        float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularPBL*lightColor*FresnelTerm(specularColor, LdotH);
        float3 specular = directSpecular;
// Diffuse:
        NdotL = max(0.0,dot( normalDirection, lightDirection ));
        half fd90 = 0.5 + 2 * LdotH * LdotH * (1-gloss);
        float3 directDiffuse = ((1 +(fd90 - 1)*pow((1.00001-NdotL), 5)) * (1 + (fd90 - 1)*pow((1.00001-NdotV), 5)) * NdotL) * attenColor;
        float3 diffuse = directDiffuse * diffuseColor;
// Final Color:
        float3 finalColor = diffuse + specular;
        return fixed4(finalColor * 1,0);
    }
    ENDCG
}
Pass {
    Name "ShadowCaster"
    Tags {
        "LightMode"="ShadowCaster"
    }
    Offset 1, 1
    
    CGPROGRAM
    #pragma vertex vert
    #pragma fragment frag
    #define UNITY_PASS_SHADOWCASTER
    #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
    #define _GLOSSYENV 1
    #include "UnityCG.cginc"
    #include "Lighting.cginc"
    #include "UnityPBSLighting.cginc"
    #include "UnityStandardBRDF.cginc"
    #pragma fragmentoption ARB_precision_hint_fastest
    #pragma multi_compile_shadowcaster
    #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
    #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
    #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
    #pragma multi_compile_fog
    #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
    #pragma target 3.0
    uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
    uniform fixed _UseAlpha;
    uniform sampler2D _OpacityMap; uniform float4 _OpacityMap_ST;
    uniform float _Cutoff;
    struct VertexInput {
        float4 vertex : POSITION;
        float2 texcoord0 : TEXCOORD0;
        float2 texcoord1 : TEXCOORD1;
        float2 texcoord2 : TEXCOORD2;
    };
    struct VertexOutput {
        V2F_SHADOW_CASTER;
        float2 uv0 : TEXCOORD1;
        float2 uv1 : TEXCOORD2;
        float2 uv2 : TEXCOORD3;
        float4 posWorld : TEXCOORD4;
    };
    VertexOutput vert (VertexInput v) {
        VertexOutput o = (VertexOutput)0;
        o.uv0 = v.texcoord0;
        o.uv1 = v.texcoord1;
        o.uv2 = v.texcoord2;
        o.posWorld = mul(unity_ObjectToWorld, v.vertex);
        o.pos = UnityObjectToClipPos(v.vertex);
        TRANSFER_SHADOW_CASTER(o)
        return o;
    }
    float4 frag(VertexOutput i) : COLOR {
// Vectors:
        float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
        float4 _OpacityMap_var = tex2D(_OpacityMap,TRANSFORM_TEX(i.uv0, _OpacityMap));
        float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
        clip(saturate((lerp( _OpacityMap_var.a, _MainTex_var.a, _UseAlpha )*_Cutoff)) - 0.5);
        SHADOW_CASTER_FRAGMENT(i)
    }
    ENDCG
}
Pass {
    Name "Meta"
    Tags {
        "LightMode"="Meta"
    }
    Cull Off
    
    CGPROGRAM
    #pragma vertex vert
    #pragma fragment frag
    #define UNITY_PASS_META 1
    #define SHOULD_SAMPLE_SH ( defined (LIGHTMAP_OFF) && defined(DYNAMICLIGHTMAP_OFF) )
    #define _GLOSSYENV 1
    #include "UnityCG.cginc"
    #include "Lighting.cginc"
    #include "UnityPBSLighting.cginc"
    #include "UnityStandardBRDF.cginc"
    #include "UnityMetaPass.cginc"
    #pragma fragmentoption ARB_precision_hint_fastest
    #pragma multi_compile_shadowcaster
    #pragma multi_compile LIGHTMAP_OFF LIGHTMAP_ON
    #pragma multi_compile DIRLIGHTMAP_OFF DIRLIGHTMAP_COMBINED DIRLIGHTMAP_SEPARATE
    #pragma multi_compile DYNAMICLIGHTMAP_OFF DYNAMICLIGHTMAP_ON
    #pragma multi_compile_fog
    #pragma exclude_renderers gles3 metal d3d11_9x xbox360 xboxone ps3 ps4 psp2 
    #pragma target 3.0
    uniform float4 _Color;
    uniform float4 _EmissionColor;
    uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
    uniform sampler2D _EmissionMap; uniform float4 _EmissionMap_ST;
    uniform float _Metallic;
    uniform float _Glossiness;
    uniform float _EmissionLM;
    uniform fixed _MetalAlphaGloss;
    uniform sampler2D _SmoothnessMap; uniform float4 _SmoothnessMap_ST;
    uniform sampler2D _MetallicGlossMap; uniform float4 _MetallicGlossMap_ST;
    struct VertexInput {
        float4 vertex : POSITION;
        float2 texcoord0 : TEXCOORD0;
        float2 texcoord1 : TEXCOORD1;
        float2 texcoord2 : TEXCOORD2;
    };
    struct VertexOutput {
        float4 pos : SV_POSITION;
        float2 uv0 : TEXCOORD0;
        float2 uv1 : TEXCOORD1;
        float2 uv2 : TEXCOORD2;
        float4 posWorld : TEXCOORD3;
    };
    VertexOutput vert (VertexInput v) {
        VertexOutput o = (VertexOutput)0;
        o.uv0 = v.texcoord0;
        o.uv1 = v.texcoord1;
        o.uv2 = v.texcoord2;
        o.posWorld = mul(unity_ObjectToWorld, v.vertex);
        o.pos = UnityMetaVertexPosition(v.vertex, v.texcoord1.xy, v.texcoord2.xy, unity_LightmapST, unity_DynamicLightmapST );
        return o;
    }
    float4 frag(VertexOutput i) : SV_Target {
// Vectors:
        float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
        UnityMetaInput o;
        UNITY_INITIALIZE_OUTPUT( UnityMetaInput, o );
        
        float4 _EmissionMap_var = tex2D(_EmissionMap,TRANSFORM_TEX(i.uv0, _EmissionMap));
        o.Emission = (_EmissionColor.rgb*_EmissionMap_var.rgb*_EmissionLM*_EmissionMap_var.a);
        
        float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
        float3 diffColor = (_Color.rgb*_MainTex_var.rgb);
        float specularMonochrome;
        float3 specColor;
        float4 _MetallicGlossMap_var = tex2D(_MetallicGlossMap,TRANSFORM_TEX(i.uv0, _MetallicGlossMap));
        diffColor = DiffuseAndSpecularFromMetallic( diffColor, (_MetallicGlossMap_var.r*_Metallic), specColor, specularMonochrome );
        float4 _SmoothnessMap_var = tex2D(_SmoothnessMap,TRANSFORM_TEX(i.uv0, _SmoothnessMap));
        float roughness = 1.0 - (lerp( _SmoothnessMap_var.r, _MetallicGlossMap_var.a, _MetalAlphaGloss )*_Glossiness);
        o.Albedo = diffColor + specColor * roughness * roughness * 0.5;
        
        return UnityMetaFragment( o );
    }
    ENDCG
}
}
FallBack "Standard"
CustomEditor "ShaderForgeMaterialInspector"
}
