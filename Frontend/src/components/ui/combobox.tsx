"use client"

import * as React from "react"
import { Check, ChevronsUpDown } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import {
  Command,
  CommandEmpty,
  CommandGroup,
  CommandInput,
  CommandItem,
  CommandList,
} from "@/components/ui/command"
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from "@/components/ui/popover"

interface Framework {
    value: string;
    label: string;
}

interface ComboboxDemoProps {
    frameworks: Framework[];
    placeholder: string;
    defaultValue?: string;
    onValueChange: (value: string) => void;
}

export function ComboboxDemo({
    frameworks,
    placeholder,
    defaultValue = "",
    onValueChange
}: ComboboxDemoProps) {
  const [open, setOpen] = React.useState(false)
  const [value, setValue] = React.useState(defaultValue)

  React.useEffect(() => {
    setValue(defaultValue)
  }, [defaultValue])

  const handleValueChange = (currentValue: string) => {
    setValue(currentValue);
    onValueChange(currentValue);
    setOpen(false);
  };

  const handleItemClick = (currentValue: string) => {
    console.log(`Item clicked: ${currentValue}`); // Debugging log
    handleValueChange(currentValue);
  };

  return (
    <Popover open={open} onOpenChange={setOpen}>
      <PopoverTrigger asChild>
        <Button
          variant="outline"
          role="combobox"
          aria-expanded={open}
          className="w-[200px] justify-between"
          onClick={() => setOpen(!open)} // Toggle popover on button click
        >
          {value
            ? frameworks.find((framework) => framework.value === value)?.label
            : placeholder}
          <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
        </Button>
      </PopoverTrigger>
      <PopoverContent className="w-[200px] p-0">
        <Command>
          <CommandInput placeholder={placeholder} />
          <CommandEmpty>No framework found.</CommandEmpty>
          <CommandList>
            <CommandGroup>
              {frameworks.map((framework) => (
                <CommandItem
                  key={framework.value}
                  value={framework.value}
                  onSelect={() => handleItemClick(framework.value)} // Ensure onSelect is correct
                  onClick={() => handleItemClick(framework.value)} // Ensure onClick is correct
                >
                  <Check
                    className={cn(
                      "mr-2 h-4 w-4",
                      value === framework.value ? "opacity-100 cursor-pointer" : "opacity-0"
                    )}
                  />
                  {framework.label}
                </CommandItem>
              ))}
            </CommandGroup>
          </CommandList>
         </Command>
      </PopoverContent>
    </Popover>
  )
}