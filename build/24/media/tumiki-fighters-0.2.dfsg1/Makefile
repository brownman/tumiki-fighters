DC=gdmd-v1
#DC=gdc
ifeq ($(DC), gdmd-v1)
DFLAGS=-g -debug -O
#DFLAGS=-g -debug
DOUT=-of
else
DFLAGS=-O -debug
#DFLAGS=-g -fdebug
DOUT=-o
endif

DSRC=$(shell find src/ -name "*.d")
SOURCES=$(DSRC) import/SDL_video.d import/SDL_mixer.d
OBJS=$(SOURCES:.d=.o)
EXE=tumiki-fighters

all: $(EXE)

$(EXE): $(OBJS)
	gdc-v1 -o $@ $(OBJS) -lbulletml -lSDL -lGL -lSDL_mixer

$(OBJS): %.o: %.d
	gdmd-v1 -d -c -of$@ $(DFLAGS) -Iimport -Isrc $<

clean:
	$(RM) src/*.o
	$(RM) src/abagames/tf/*.o
	$(RM) src/abagames/util/*.o
	$(RM) src/abagames/util/sdl/*.o
	$(RM) src/abagames/util/bulletml/*.o
	$(RM) import/*.o
