#include "library.h"

#if __EMSCRIPTEN__

#include <emscripten/bind.h>    
     
using namespace emscripten;    
     
EMSCRIPTEN_BINDINGS(bind) {    
  function("PrintHelloWorld", &PrintHelloWorld);    
}    

#endif  // __EMSCRIPTEN__

int main() {

}
