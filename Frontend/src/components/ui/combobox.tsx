"use client"

import * as React from "react"
import { Check, ChevronsUpDown, Plus } from "lucide-react"
import { Button } from "@/components/ui/button"
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu"
import { cn } from "@/lib/utils"
import { useRouter } from "next/navigation"

interface Framework {
  value: string
  label: string
}

interface ComboboxDemoProps {
  frameworks: Framework[]
  placeholder: string
  defaultValue?: string
  onValueChange: (value: string) => void
  setCreateRoomClick: React.Dispatch<React.SetStateAction<boolean>>
}

export function ComboboxDemo({
  frameworks,
  placeholder,
  defaultValue = "",
  onValueChange,
  setCreateRoomClick
}: ComboboxDemoProps) {
  const [open, setOpen] = React.useState(false)
  const [value, setValue] = React.useState(defaultValue)
  const router = useRouter();

  React.useEffect(() => {
    setValue(defaultValue)
  }, [defaultValue])

  const handleValueChange = (currentValue: string) => {
    setValue(currentValue)
    onValueChange(currentValue)
    setOpen(false)
  }

  const handleItemClick = (currentValue: string) => {
    handleValueChange(currentValue)
  }

  const handleClickRoom = () => {

    router.push('/createroom')
  }

  return (
    <DropdownMenu open={open} onOpenChange={setOpen}>
      <DropdownMenuTrigger asChild>
        <Button
          variant="outline"
          className="w-[200px] justify-between"
          onClick={() => setOpen(!open)}
        >
          {value
            ? frameworks.find((framework) => framework.value === value)?.label
            : placeholder}
          <ChevronsUpDown className="ml-2 h-4 w-4 shrink-0 opacity-50" />
        </Button>
      </DropdownMenuTrigger>
      <DropdownMenuContent className="w-[200px] p-0">
        <DropdownMenuLabel>{placeholder}</DropdownMenuLabel>
        <DropdownMenuSeparator />
        <DropdownMenuItem
          onClick={handleClickRoom}
          className="flex items-center cursor-pointer"
        >
          <Plus
            className="mr-2 h-4 w-4"/>
          Create Room
        </DropdownMenuItem>
        {frameworks.map((framework) => (
          <DropdownMenuItem
            key={framework.value}
            onClick={() => handleItemClick(framework.value)}
            className="flex items-center cursor-pointer"
          >
            <Check
              className={cn(
                "mr-2 h-4 w-4",
                value === framework.value ? "opacity-100" : "opacity-0"
              )}
            />
            {framework.label}
          </DropdownMenuItem>
        ))}
      </DropdownMenuContent>
    </DropdownMenu>
  )
}
