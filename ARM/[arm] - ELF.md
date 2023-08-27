## [arm] - ELF, Executable and Linking Format

> The ELF format is linux’s chosen executable file format. In fact, it stands for Executable and Linkable Format. Within the ELF format are defined several structures which store program data.
The three structures we will be looking at are the Elf32_Ehdr, Elf32_Phdr, and Elf32_Shdr struct, which are the Elf Header, Program Header, and Section Headers structures, defined as:

#### **ELF Header Format**
```c
#define EI_NIDENT 16
   typedef struct {
       unsigned char e_ident[EI_NIDENT];
       uint16_t      e_type;
       uint16_t      e_machine;
       uint32_t      e_version;
       ElfN_Addr     e_entry;
       ElfN_Off      e_phoff;
       ElfN_Off      e_shoff;
       uint32_t      e_flags;
       uint16_t      e_ehsize;
       uint16_t      e_phentsize;
       uint16_t      e_phnum;
       uint16_t      e_shentsize;
       uint16_t      e_shnum;
       uint16_t      e_shstrndx;
   } Elf32_Ehdr;
```

>“ELF program headers are what describe segments within a binary and are necessary for program loading. Segments are understood by the kernel during load time and describe the memory layout of an executable on disk and how it should translate to memory. The program header table can be accessed by referencing the offset found in the initial ELF header member called e__phoff”
>
> -- <cite>“Learning Linux Binary Analysis”:</cite>
```c
typedef struct {
    uint32_t   p_type;       //segment type
    Elf32_Off  p_offset;     //segment offset
    Elf32_Addr p_vaddr;      //segment virtual address
    Elf32_Addr p_paddr;      //segment physical address
    uint32_t   p_filesz;     //size of segment in the file
    uint32_t   p_memsz;      //size of segment in memory
    uint32_t   p_flags;      //segment flags, I.E execute|read|read
    uint32_t   p_align;      //segment alignment in memory
  } Elf32_Phdr;
  ```
  >“A section header table exists to reference the location and size of these sections and is primarily for linking and debugging purposes. Section headers are not necessary for program execution, and a program will execute just fine without having a section header table. This is because the section header table doesn’t describe the program memory layout. That is the responsibility of the program header table. The section headers are really just complimentary to the program headers. The readelf –l command will show which sections are mapped to which segments, which helps to visualize the relationship between sections and segments.”
  >
  > -- <cite>“Learning Linux Binary Analysis”</cite>

  ```c
  typedef struct {
uint32_t   sh_name;        // offset into shdr string table for shdr name
    uint32_t   sh_type;    // shdr type I.E SHT_PROGBITS
    uint32_t   sh_flags;   // shdr flags I.E SHT_WRITE|SHT_ALLOC
    Elf32_Addr sh_addr;    // address of where section begins
    Elf32_Off  sh_offset;  // offset of shdr from beginning of file
    uint32_t   sh_size;    // size that section takes up on disk
    uint32_t   sh_link;    // points to another section
    uint32_t   sh_info;    // interpretation depends on section type
uint32_t   sh_addralign;   // alignment for address of section
uint32_t   sh_entsize;     // size of each certain entries that may be in section
} Elf32_Shdr;
```


