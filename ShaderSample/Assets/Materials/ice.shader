Shader "Custom/ice"
{
    Subshader {
        Tags{"Queue" = "Transparent" }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard alpha:fade
        #pragma target 3.0

        struct Input{
            float3 worldNormal;
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutputStandard o){
            // ベースカラー
            o.Albedo = fixed4(1,1,1,1);
            // 視線ベクトルとオブジェクトの法線ベクトルの内積を出す
            // 垂直に交わる場合は0,平行の場合は1,もしくは-1になる
            float alpha = 1 - (abs(dot(IN.viewDir,IN.worldNormal)));
            // 輝度
            float luminance = 1.5f;
            o.Alpha = alpha * luminance;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
