package com.example.service.events.listener;

import io.cloudevents.CloudEvent;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import studio.develfish.guppy.common.events.CloudEventsConstants;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.kafka.support.Acknowledgment;
import org.springframework.stereotype.Component;

import java.util.List;

@Slf4j
@Component("serviceEvents.publicDispatchListener")
public class PublicDispatchListener {

    @KafkaListener(
        containerFactory = CloudEventsConstants.CONTAINER_FACTORY_CLOUD_EVENT,
        batch = "true",
        groupId = "${app.service_events.listener.public_dispatch.group_id:service_events.public_dispatch}",
        topicPattern = "${app.service_events.listener.public_dispatch.topic_pattern:public_dispatch}"
    )
    public void listen(List<ConsumerRecord<String, CloudEvent>> list, Acknowledgment ack) {
        try {
            log.info("Attempt to process cloud events");

            // TODO Implement

            ack.acknowledge();
        } catch (Exception e) {
            log.error("Cannot process cloud events", e);
        }
    }
}
