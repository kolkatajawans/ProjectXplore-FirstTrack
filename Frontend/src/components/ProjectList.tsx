import { userAtom } from '@/lib/atoms/userAtom';
import { domain } from '@/lib/domain';
import axios from 'axios';
import { useAtom } from 'jotai';
import { useEffect, useState } from 'react';
import { Card, CardContent, CardHeader } from './ui/card';
import { useToast } from './ui/use-toast';

const ProjectList = () => {
    const { toast } = useToast();
    const [user] = useAtom(userAtom);
    const [projectList, setProjectList] = useState<any[]>([]);

    const getdata = async () => {
        try {
            const response = await axios.get(`${domain}/api/v1/project/list`, {
                params: { userId: user }
            });
            console.log(response);
            setProjectList(response.data);
            
        } catch (error) {
            console.log(error);
            toast({
                title: "Error",
                description: "Error occurred while retrieving projects"
            });
        }
    };

    useEffect(() => {
        getdata();
    }, [user]);
    return (
        <>
            {projectList.length > 0 ? (
                projectList.map((project) => (
                    <Card key={project.id} className='mx-6'>
                        <CardHeader>
                            {project.name}
                        </CardHeader>
                        <CardContent className='text-sm'>
                            {project.description}
                        </CardContent>
                    </Card>
                ))
            ) : (
                <div>No projects found.</div>
            )}
        </>
    );
};

export default ProjectList;
