import boto3
import sys
client = boto3.client('ec2')
#ec2 = boto3.resource('ec2')
#instance = ec2.Instance('id')
if len(sys.argv) >= 3:
   region = sys.argv[1]
   type1  = sys.argv[2]
   inst = sys.argv[3].split()
   print inst
   for i in inst:
       #print i
       response = client.describe_instances(InstanceIds=[i])
       state =  response[u'Reservations'][0][u'Instances'][0][u'State'][u'Name']
       InstType =  response[u'Reservations'][0][u'Instances'][0][u'InstanceType']
       if state == "running" or state != "running":
          response = client.stop_instances(InstanceIds=[i])
          #print response
          while response[u'StoppingInstances'][0][u'CurrentState'][u'Name'] == "stopping":
          #      print "Stopping......"
#               response = client.describe_instance_status(InstanceIds=[i])
                waiter = client.get_waiter('instance_stopped')
                stop = waiter.wait(InstanceIds=[i])
                break
          #print "hello"
          response1 = client.describe_instances(InstanceIds=[i])
          state1 =  response1[u'Reservations'][0][u'Instances'][0][u'State'][u'Name']
          #print state1
          #print i
          if state1 == 'stopped':
             response = client.modify_instance_attribute(
                         InstanceId=i,
                         InstanceType={
                         'Value': sys.argv[2]
                         })
             response = client.start_instances(InstanceIds=[i])
             #waiter = client.get_waiter('instance_running')
             #run = waiter.wait(InstanceIds=[i])
             #break
             response2 = client.describe_instances(InstanceIds=[i])
             update_inst = response2[u'Reservations'][0][u'Instances'][0][u'InstanceType']
             print update_inst

