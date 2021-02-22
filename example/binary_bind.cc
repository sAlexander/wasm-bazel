#include "library.h"

#include <emscripten/bind.h>    
     
using namespace emscripten;    
     
EMSCRIPTEN_BINDINGS(bind) {    
  function("PrintHelloWorld", &PrintHelloWorld);    
}    

