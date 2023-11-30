# translate otter_memory.mem (words) to otter_memory_blocks.mem (blocks)

WORD_WIDTH = 32  # bits
WORDS_PER_BLOCK = 4

def write_block(out, b):
    out.write(f"{b:0{int(WORDS_PER_BLOCK * WORD_WIDTH / 4)}x}\n")

with open('otter_memory_blocks.mem', 'w') as out:
    i = 0
    b = 0
    for word in open('otter_memory.mem', 'r'):
        b += int(word, 16) << i * WORD_WIDTH
        i = (i + 1) % WORDS_PER_BLOCK
        if i == 0:
            write_block(out, b)
            b = 0
    if i != 0:
        write_block(out, b)
