def quantum_grassmannian_poset(p,m,k):
    p=Partition(p)
    D=DiGraph()
    D.add_vertex(p) 
    queue=[p]  
    seen={p:0}
    while queue:
        p=queue.pop()
        if seen[p]==m+k-1:
            continue 
        if p==[]:
            up_list=[Partition([1])]
        else:
            up_list=p.up_list()
        for q in up_list:
            s=SkewPartition([q,p])
            r=s.cells() 
            u=[q.content(*t)+k%(m+k) for t in r]
            new_edge=False 
            if q.arm_length(0,0) <= m-1 and q.length() <= k:            
                new_edge=True
            if q.arm_length(0,0) == m-1 and q.length() == k+1:
                new_edge=True
                cells = q.rim()
                for c in cells:
                    q = q.remove_cell(c[0])         
            if new_edge is True:
                D.add_edge(p,q,u[0])
                if q not in seen:
                    seen[q]=seen[p]+1
                    queue.append(q)
    return D