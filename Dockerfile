FROM node:16

RUN npm install antlers-formatter -g

COPY "entrypoint.sh" "/entrypoint.sh"
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
