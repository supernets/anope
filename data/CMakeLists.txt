set(DATA botserv.conf services.conf hostserv.conf operserv.conf chanserv.conf global.conf nickserv.conf)
install(FILES ${DATA}
  DESTINATION ${CONF_DIR}
)
