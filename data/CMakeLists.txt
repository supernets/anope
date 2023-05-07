set(DATA botserv.conf chanserv.conf global.conf hostserv.conf nickserv.conf operserv.conf services.conf)
install(FILES ${DATA}
  DESTINATION ${CONF_DIR}
)
