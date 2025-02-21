FROM libretranslate/libretranslate:latest AS models_cache

ARG filter=true
# replace with preferred languages
ARG languages="en,fr,ko"

USER libretranslate

WORKDIR /app

RUN if [ "$filter" = "true" ]; then \
        ./venv/bin/python ../app/scripts/install_models.py --load_only_lang_codes "$languages"; \
    else \
        ./venv/bin/python ../app/scripts/install_models.py; \
    fi

RUN ./venv/bin/pip install . && ./venv/bin/pip cache purge

FROM models_cache AS final
ENTRYPOINT [ "./venv/bin/libretranslate", "--host", "0.0.0.0" ]
