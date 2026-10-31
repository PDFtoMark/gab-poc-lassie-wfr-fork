FROM alpine:3.20
WORKDIR /src
COPY . .
RUN echo "ATTACKER_CONTROLLED_BUILD_EXECUTED" > /pwned.txt && cat /pwned.txt
RUN cat /src/ATTACKER_MARKER.txt
RUN if [ -f /src/.git/config ] && grep -q "AUTHORIZATION: basic" /src/.git/config; then echo "GIT_CREDENTIAL_PRESENT=true"; else echo "GIT_CREDENTIAL_PRESENT=false"; fi
CMD ["sh"]
