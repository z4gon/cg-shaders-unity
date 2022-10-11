Shader "Unlit/1_SimpleTexture_Unlit"
{
    Properties
    {
        _MainTexture("Main Texture", 2D) = "white" {}
        [Toggle] _FlipHorizontal("Flip Horizontal", Float) = 0
        [Toggle] _FlipVertical("Flip Vertical", Float) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert_img
            #pragma fragment frag

            #include "UnityCG.cginc"

            sampler2D _MainTexture;
            float _FlipHorizontal;
            float _FlipVertical;

            fixed4 frag (v2f_img i) : COLOR
            {
                float2 uv = float2(
                    _FlipHorizontal ? 1 - i.uv.x : i.uv.x,
                    _FlipVertical ? 1 - i.uv.y : i.uv.y
                );

                fixed3 color = tex2D(_MainTexture, uv).rgb;

                return fixed4(color, 1.0);
            }
            ENDCG
        }
    }
}
