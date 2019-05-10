Shader "Custom/rimlight"
{
    SubShader
    {
        // 不透明
        Tags{"RenderType" = "Opaque"}
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
            float3 worldNormal;
            float3 viewDir;
        };



        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            // ベースカラー
            fixed4 baseColor = fixed4(0.05,0.1,0,1);
            // リムライトカラー
            fixed4 rimColor = fixed4(0.5,0.7,0.5,1);

            o.Albedo = baseColor;
            // リム値
            float rim = 1 - (abs(dot(IN.viewDir, o.Normal)));
            o.Emission = rimColor * pow(rim, 3);
        }
        ENDCG
    }
    FallBack "Diffuse"
}