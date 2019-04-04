.PHONY: all

GCC = g++
CFLAGS = -std=c++17 -Wall -O3
LDFLAGS = -I.
OBJDIR = obj

CLASSES =
OBJECTS = $(addsuffix .o, $(CLASSES))
OBJFILES = $(addprefix $(OBJDIR)/, $(OBJECTS))

all: main

main: $(OBJDIR)/main.o $(OBJFILES)
	$(GCC) -o main $(CFLAGS) $(OBJDIR)/main.o $(OBJFILES) $(LDFLAGS)

$(OBJDIR)/main.o: main.cpp
	$(GCC) -c $(CFLAGS) main.cpp -o $(OBJDIR)/main.o

.SECONDEXPANSION:
$(OBJFILES): %.o: $$(notdir %.cpp %.h)
	$(GCC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf $(OBJDIR)/*.o
	rm main
