BUILD_DIR=build
ANTLR4_JAR=/usr/local/lib/antlr-4.9.1-complete.jar
ANTLR4_DIR=antlr4

all: antlr4-java


clean:
	@$(MAKE) -C $(BUILD_DIR) clean

antlr4-java:
	@rm -rf ${ANTLR4_DIR}/java-target && mkdir -p ${ANTLR4_DIR}/java-target
	cd ${ANTLR4_DIR} && \
		java -jar ${ANTLR4_JAR} AntlrTest.g4 -visitor -o java-target && \
		javac java-target/*.java

grun:
	cd ${ANTLR4_DIR}/java-target && java org.antlr.v4.gui.TestRig AntlrTest ${RULE} ${CMD} ${FILE}

NO_PHONY = /^(z):/
.PHONY: $(shell cat $(MAKEFILE_LIST) | awk -F':' '/^[a-z0-9_-]+:/ && !$(NO_PHONY) {print $$1}')
