"use client";
import CreateRoom from "@/components/CreateRoom";
import Project from "@/components/Project";
import ProjectList from "@/components/ProjectList";
import SearchDialog from "@/components/SearchDialouge";
import { Avatar, AvatarFallback, AvatarImage } from "@/components/ui/avatar";
import { Button } from "@/components/ui/button";
import { ComboboxDemo } from "@/components/ui/combobox";
import {
    Dialog,
    DialogClose,
    DialogContent,
    DialogDescription,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Popover, PopoverTrigger } from "@/components/ui/popover";
import { ScrollArea } from "@/components/ui/scroll-area";
import { Separator } from "@/components/ui/separator";
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from "@/components/ui/table";
import { useToast } from "@/components/ui/use-toast";
import { domain } from "@/lib/domain";
import useAuth from "@/lib/hooks/useUser";
import { PopoverContent } from "@radix-ui/react-popover";
import axios from "axios";
import { LogOut, Settings, UserCircle } from "lucide-react";
import { useRouter } from "next/navigation";
import { useEffect, useState } from "react";

const roomsarray = [
    { value: "1", label: "kolkata Jawans" },
    { value: "2", label: "BharaBytes" },
];

const Page = () => {
    // Capitalized the component name
    const router = useRouter();
    const { loading, authenticated } = useAuth();
    const [refresh,setrefresh] = useState<boolean>(false)

    const [RoomChoice, setRoomChoice] = useState<string>("1");
    const [CreateRoomClick, setCreateRoomClick] = useState<boolean>(false);
    const {toast} = useToast();

    useEffect(() => {
        if (CreateRoomClick) {
        }
    }, [CreateRoomClick]);

    const handleRoomValueChange = (newValue: string) => {
        setRoomChoice(newValue);
    };
    if (authenticated == false && loading == false) {
        return (
            <div className="w-screen h-screen flex justify-center items-center text-[150px]">
                Please Login
            </div>
        );
    }

    const handleLogout = async () => {
      try {
        const response = await axios.post(`${domain}/api/v1/users/logout`,{},{withCredentials:true}); 
        if(response.status===200){
            router.push('/'); 
        }
      } catch (error) {
        console.error('Error during logout:', error);
        toast({
            title:"Error Occured During logging out",
            description:"Possible Reason Cookie was cleared"
        })
      }
    };
    if (loading || authenticated == false) {
        return <div>Loading</div>;
    }else if(refresh){
        return <div>Loading</div>;
    } else {
        return (
            <main className="flex flex-col w-screen min-h-screen overflow-hidden m-0 p-0 ">
                <div className="absolute top-0 right-0 left-0 h-16 flex justify-between items-center px-4 bg-background">
                    <div className="flex justify-center items-center">
                        <ComboboxDemo
                            frameworks={roomsarray}
                            placeholder="Select a team..."
                            defaultValue={RoomChoice}
                            onValueChange={handleRoomValueChange}
                            setCreateRoomClick={setCreateRoomClick}
                        />
                        <div className="flex justify-center items-center gap-4 px-4">
                            <div>Dashboard</div>
                            <div>Explore</div>
                            <div>Friends</div>
                            <div>Settings</div>
                        </div>
                    </div>
                    <div className="flex justify-center items-center gap-5">
                        <Input placeholder="Search.." />
                        <Popover>
                            <PopoverTrigger >
                                <Avatar>
                                <AvatarImage src="/usericon.png" />
                                <AvatarFallback />
                                </Avatar>
                            </PopoverTrigger>
                            <PopoverContent className=" w-60 h-full  flex flex-col justify-end">
                                <Button className="w-full flex gap-4 rounded-none" variant="outline">
                                    <Settings />
                                    Settings
                                </Button>
                                <Button className="w-full flex gap-4 rounded-none" variant="outline">
                                    <UserCircle />
                                    Profile
                                </Button>
                                <Button className="w-full flex gap-4 rounded-none" variant="outline" onClick={handleLogout}>
                                    <LogOut />
                                    Log out
                                </Button>
                            </PopoverContent>
                        </Popover>
                    </div>
                </div>
                <Separator />
                <div className="flex-1 flex flex-col mt-16 h-full">
                    <div className="flex-1 grid grid-cols-3 gap-4 p-5">
                        <div
                            id="projectlist"
                            className="col-start-1 col-end-2 bg-background border-2"
                        >
                            <h1 className="m-2 text-xl">Project List</h1>
                            <ScrollArea>
                                <ProjectList />
                            </ScrollArea>
                        </div>
                        <div
                            id="createproject"
                            className="col-start-2 col-end-3 bg-background flex justify-center items-center"
                        >
                            <Project setRefresh={setrefresh}/>
                        </div>
                        <div
                            id="AboutYou"
                            className="col-start-3 col-end-4 bg-background "
                        >
                            {/* Content here */}
                        </div>
                    </div>
                </div>
                <Dialog
                    open={CreateRoomClick}
                    onOpenChange={setCreateRoomClick}
                >
                    {/* <CreateRoom /> */}
                </Dialog>
            </main>
        );
    }
};

export default Page;
