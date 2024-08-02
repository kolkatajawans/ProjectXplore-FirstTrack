'use client'
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar'
import { Card, CardContent, CardDescription, CardTitle } from '@/components/ui/card'
import { ComboboxDemo } from '@/components/ui/combobox'
import { Input } from '@/components/ui/input'
import { Label } from '@/components/ui/label'
import { ScrollArea } from '@/components/ui/scroll-area'
import { Separator } from '@/components/ui/separator'
import { Textarea } from '@/components/ui/textarea'
import React, { useState } from 'react'

const roomsarray = [
    { value: "1", label: "kolkata Jawans" }
]
const projectsarray = [
    { value: "1", label: "Create Project" },
    { value: "2", label: "Update Project" },
]

const Page = () => { // Capitalized the component name
    const [ProjectChoice, setProjectChoice] = useState<string>("1"); // Adjusted default value
    const [RoomChoice, setRoomChoice] = useState<string>("1");

    const handleProjectValueChange = (newValue: string) => {
        setProjectChoice(newValue);
    };

    const handleRoomValueChange = (newValue: string) => {
        setRoomChoice(newValue);
    };

    return (
        <main className='flex flex-col w-screen min-h-screen overflow-hidden m-0 p-0'>
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
                        <Card className='w-full flex flex-col justify-center items-start'>
                            <CardTitle className='w-full flex justify-start ml-6'>
                                <ComboboxDemo
                                    frameworks={projectsarray}
                                    placeholder="Select a project..."
                                    defaultValue={ProjectChoice}
                                    onValueChange={handleProjectValueChange}
                                />
                            </CardTitle>
                            <CardDescription className='w-full flex justify-start ml-6'>
                                Share your new project
                            </CardDescription>
                            <CardContent className='w-full flex justify-center p-0'>
                                <form className='w-full flex justify-center flex-1'>
                                    <div className="grid w-full items-center gap-4 justify-center flex-1">
                                        <div className="flex flex-col space-y-1.5 w-full justify-center">
                                            <Label htmlFor="name" className='w-full justify-start pl-6'>Name</Label>
                                            <Input id="name" placeholder="Name of your project" />
                                        </div>      
                                        <div className="flex flex-col space-y-1.5">
                                            <Label htmlFor="desc">Description</Label>
                                            <Textarea id="desc" placeholder="Description of your project" />
                                        </div>
                                        <div className="flex flex-col space-y-1.5">
                                            <Label htmlFor="link">Usefull Link</Label>
                                            <Input id="1" placeholder="xyz.com" />
                                        </div>
                                    </div>
                                </form>
                            </CardContent>

                        </Card>
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
