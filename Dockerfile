FROM nginx
RUN apt update && apt install -y unzip
RUN curl -o dowcload.zip -LO https://codeload.github.com/wyagd001/wyagd001.github.io/zip/refs/heads/master \
    && unzip -o dowcload.zip "wyagd001.github.io-master/404.html" "wyagd001.github.io-master/zh-cn/*.*" "wyagd001.github.io-master/v2/*.*" -d /down/  \
    && rm -rf dowcload.zip \
    && rm -rf "/down/wyagd001.github.io-master/zh-cn/#U9884#U89c8#U6697#U9ed1#U7248.ahk" "/down/wyagd001.github.io-master/zh-cn/#U9884#U89c8.ahk" "/down/wyagd001.github.io-master/zh-cn/Readme.md" \
    && rm -rf "/down/wyagd001.github.io-master/v2/#U9884#U89c8#U6697#U9ed1#U7248.ahk" "/down/wyagd001.github.io-master/zh-cn/Readme.md" \
    && mv /down/wyagd001.github.io-master/404.html /down/wyagd001.github.io-master/v2 /usr/share/nginx/html/ \
    && mv /down/wyagd001.github.io-master/zh-cn /usr/share/nginx/html/v1 \
    && sed -i 's/https:\/\/wyagd001.github.io\/zh-cn\/docs\//\/v1\/docs\//g' /usr/share/nginx/html/v1/docs/static/content.js \
    && sed -i 's/https:\/\/wyagd001.github.io\/v2\/docs\//\/v2\/docs\//g' /usr/share/nginx/html/v1/docs/static/content.js \
    && sed -i 's/https:\/\/wyagd001.github.io\/zh-cn\/docs\//\/v1\/docs\//g' /usr/share/nginx/html/v2/docs/static/content.js \
    && sed -i 's/https:\/\/wyagd001.github.io\/v2\/docs\//\/v2\/docs\//g' /usr/share/nginx/html/v2/docs/static/content.js \
    && rm -rf down \
    && rm -rf /var/lib/apt/lists/*
COPY default.conf /etc/nginx/conf.d/

#RUN apt-get update \
#  && apt-get install -y unzip \
#  && rm -rf /var/lib/apt/lists/*
