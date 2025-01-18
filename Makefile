CXX = g++

LIBS = -L. \
	   -L./lib \
      -lglew32\
	  -lglfw3 \
	  -lopengl32 \
	  -lgdi32

INCLUDES = -I./includes -Ithird_party/imgui -Ithird_party/imgui/backends -Ithird_party/imgui_filedialog

WARNINGS=-Wall

FLAGS=-std=c++17 -DIMGUI_DISABLE_WIN32_FUNCTIONS -DUSE_STD_FILESYSTEM

IMGUI_SRC = third_party/imgui/imgui.cpp third_party/imgui/imgui_draw.cpp \
	        third_party/imgui/imgui_tables.cpp third_party/imgui/imgui_widgets.cpp \
            third_party/imgui/backends/imgui_impl_glfw.cpp third_party/imgui/backends/imgui_impl_opengl3.cpp

IMGUI_FILEDIALOG_SRC = third_party/imgui_filedialog/ImGuiFileDialog.cpp

OBJS = main.o $(IMGUI_SRC:.cpp=.o) $(IMGUI_FILEDIALOG_SRC:.cpp=.o)

TARGET = hello_imgui

all: $(TARGET)

main.o: src/main.cpp
	$(CXX) -c src/main.cpp -o main.o $(INCLUDES) $(WARNINGS) $(FLAGS)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS) $(LIBS)

%.o: %.cpp
	$(CXX) -c $< -o $@ $(INCLUDES) $(WARNINGS) $(FLAGS)

clean:
	rm -rf $(OBJS) $(TARGET) $(TARGET).exe
