'use client'
import Project from '@/components/Project'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Button } from '@/components/ui/button'
import { Card, CardContent, CardDescription, CardTitle } from '@/components/ui/card'
import { ComboboxDemo } from '@/components/ui/combobox'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import Linkfiled from '@/components/ui/Linkfiled'
import Mediainput from '@/components/ui/mediainput'
import { ScrollArea } from '@/components/ui/scroll-area'
import { Separator } from '@/components/ui/separator'
import { Textarea } from '@/components/ui/textarea'
import { userAtom } from '@/lib/atoms/userAtom'
import { domain } from '@/lib/domain'
import axios from 'axios'
import { useAtom } from 'jotai'
import React, { useEffect, useState } from 'react'

const roomsarray = [
    { value: "1", label: "kolkata Jawans" },
    { value: "2", label: "BharaBytes" }
]


const Page = () => { // Capitalized the component name
    
    const [RoomChoice, setRoomChoice] = useState<string>("1");
    


    const handleRoomValueChange = (newValue: string) => {
        setRoomChoice(newValue);
    };

    return (
        <main className='flex flex-col w-screen min-h-screen overflow-hidden m-0 p-0 '>
            <div className='absolute top-0 right-0 left-0 h-16 flex justify-between items-center px-4 bg-background'>
                <div className='flex justify-center items-center'>
                    <ComboboxDemo
                        frameworks={roomsarray}
                        placeholder="Select a team..."
                        defaultValue={RoomChoice}
                        onValueChange={handleRoomValueChange}
                    />
                    <div className='flex justify-center items-center gap-4 px-4'>
                        <div>Dashboard</div>
                        <div>Explore</div>
                        <div>Friends</div>
                        <div>Settings</div>
                    </div>
                </div>
                <div className='flex justify-center items-center gap-5'>
                    <Input placeholder='Search..' />
                    <Avatar>
                        <AvatarImage src='/usericon.png' />
                        <AvatarFallback />
                    </Avatar>
                </div>
            </div>
            <Separator />
            <div className='flex-1 flex flex-col mt-16 h-full'>
                <div className='flex-1 grid grid-cols-3 gap-4 p-5'>
                    <div id="projectlist" className='col-start-1 col-end-2 bg-background border-2'>
                        <h1 className='m-2 text-xl'>Project List</h1>
                        <ScrollArea>
                            <Card className='mx-6'>
                                <CardContent className='text-sm'>
                                    param2610-cloud/employee-management-system
                                </CardContent>
                            </Card>
                        </ScrollArea>
                    </div>
                    <div id="createproject" className='col-start-2 col-end-3 bg-background'>
                        <Project/>
                    </div>
                    <div id="AboutYou" className='col-start-3 col-end-4 bg-background '>
                        {/* Content here */}
                    </div>
                </div>
            </div>
        </main>
    )
}

export default Page
