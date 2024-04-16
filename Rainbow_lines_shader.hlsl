vec3 palette( float t ) {
    vec3 a = vec3(0.5, .5, 0.5);
    vec3 b = vec3(1.5, 0.5, 1.5);
    vec3 c = vec3(1.22, 1.0, 2.9);
    vec3 d = vec3(1.263,2.416,1.0);

    return a + b*cos( 14.28318*(c-t+d) );
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = (fragCoord * .1 + iResolution.xy) / iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(.0);
    
    for (float i = 1.; i < 4.; i++) {
        uv = fract(uv +11.) + 2.;

        float d = sin((iTime - uv.y) / length(uv.y) * 0.05);

        vec3 col = palette(length(uv0) + i*.7 + iTime*.4);

        d = sin(d + iTime)/33.;
        d = abs(d);

        d = pow(0.001 / d, 1.5 );

        finalColor += col * d;
    }
        fragColor = vec4(finalColor, 1.0);

}