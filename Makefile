CXX = g++

LIBS = -L. \
	   -L./lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./includes -Ithird_party/imgui -Ithird_party/imgui/backends

WARNINGS=-w

FLAGS=-std=c++17 -DIMGUI_DISABLE_WIN32_FUNCTIONS

IMGUI_SRC = third_party/imgui/imgui.cpp third_party/imgui/imgui_draw.cpp \
	        third_party/imgui/imgui_tables.cpp third_party/imgui/imgui_widgets.cpp \
            third_party/imgui/backends/imgui_impl_glfw.cpp third_party/imgui/backends/imgui_impl_opengl3.cpp

OBJS = main.o $(IMGUI_SRC:.cpp=.o)

TARGET = hello_imgui

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS) $(LIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS)

clean:
	rm -r $(OBJS) $(TARGET)
