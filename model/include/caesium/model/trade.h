//
// Created by chuks on 08/11/2026.
//

#ifndef CAESIUM_MODEL_TRADE_H
#define CAESIUM_MODEL_TRADE_H

#include <chrono>
#include <cstdint>
#include <type_traits>

namespace caesium::model {

/*
 * Design Choice: No invariant to protect so we can use a struct.
 * We are not restricting what the price can/should be.
 * Validation will be done post-ingestion to detect and report invalid trades.
 * e.g. price can be negative.
 */
struct Trade {
    std::int64_t trade_id{}; //ids are already 64bits and timestamp won't fit 32bits.
    std::int64_t price{0};
    std::int64_t quantity{0};
    std::int64_t quote_qty{0};
    std::chrono::sys_time<std::chrono::microseconds> timestamp{};
    bool is_buyer_maker{};
    bool is_best_match{};
};

/**
 * @brief Compile-time guarantee that Trade stays trivially copyable.
 *
 * Trade is copied with plain memcpy semantics: stored contiguously in
 * std::vector, and later written to binary files, shared memory (ipc/)
 * and ring buffers (concurrent/). That requires no user-defined copy/move/
 * destructor, no virtual functions, and only trivially copyable members.
 *
 * If this fires, a change has broken that, e.g. adding a std::string
 * member or a virtual function. Fix the change; don't remove the assert.
 */
static_assert(std::is_trivially_copyable_v<Trade>,
              "Trade must be trivially copyable");

} // namespace caesium::model

#endif // CAESIUM_MODEL_TRADE_H
