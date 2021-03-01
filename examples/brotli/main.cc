#include <iostream>

#include "brotli/encode.h"
#include "brotli/decode.h"

int main() {
  std::string to_compress =
      "hello world hello world hello world hello world hello world!";

  // Welcome!
  std::cout << "Brotli wasm_bazel example." << std::endl;
  std::cout << "Compressing string \"" << to_compress << "\"" << std::endl;

  // Encode.
  std::cout << "** ENCODE **" << std::endl;
  size_t encoded_size = 100;
  uint8_t encoded[100];
  bool encode_result = BrotliEncoderCompress(
      BROTLI_DEFAULT_QUALITY, BROTLI_DEFAULT_WINDOW, BROTLI_DEFAULT_MODE,
      to_compress.size(), (uint8_t *)to_compress.data(), &encoded_size, encoded);
  std::cout << "BrotliEncoderCompress return value: " << encode_result << std::endl;
  std::cout << "Compressed size: " << encoded_size
            << " (uncompressed size: " << to_compress.size() << ")"
            << std::endl;

  // Decode.
  std::cout << "** DECODE **" << std::endl;
  size_t decoded_size = 100;
  uint8_t decoded[100];
  auto decode_result =  BrotliDecoderDecompress(
  	  encoded_size, encoded, &decoded_size, decoded);
  std::string decoded_string((char*)decoded, decoded_size);
  std::cout << "BrotliDecoderDecompress return value: " << decode_result << std::endl;
  std::cout << "Decoded string: \"" << decoded_string << "\"" << std::endl;
}
